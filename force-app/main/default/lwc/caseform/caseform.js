import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CASE_OBJECT from '@salesforce/schema/Case';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESC_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class Caseform extends LightningElement {
    recordId = "5005h00000VWeozAAD";
    objectName = CASE_OBJECT;
    fields = {
        account: ACCOUNT_FIELD,
        contact: CONTACT_FIELD,
        subject: SUBJECT_FIELD,
        priority: PRIORITY_FIELD,
        status: STATUS_FIELD,
        description: DESC_FIELD,
        origin: ORIGIN_FIELD
    };

    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success!!",
            message: "Case record has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(successToast);
    }
}