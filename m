Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5208536009B
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Apr 2021 05:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLQFv1zrmz30FC
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Apr 2021 13:44:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.95;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310095.outbound.protection.outlook.com [40.107.131.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLQFs5PKGz300b
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 13:44:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=garDlr2W7zYLWRx723Css7NOX94WayRA3uSE+QFd+YlddP1q1QPtUYDg+mtUH7w3trfBJAzPt3FjWNcIg0XSqqleeFBH7jvWCbbMv7XgdKhxNShVe02beMI87xCrTG/RQQzbzyhhFUaGXAZTqSBLXyxNxos7zE/DUQj8DOYt3o/gZ0BsaSbYjrdI/G5E3duKxOr1MbqHtM7CWa56vZsqdT+f0C1i3Mz9PF5hOi2TKFlPzFHO8sme9v6uWoxChbslN8Op0UuMnyOjvB4/TL+UgVrgTWjHg2o2ftPI07LOmc+GL1oZT9yUbTnMxrTPwK8VWUgH3OgRRt9SetK9XjU2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekNazvJ9NfQZDe/Iy9+kG+qnO8hQkwpRJojTzgWnBRw=;
 b=IUvevn64yDemq5U1/CY6r263wE0X36uW9Zr+2nvQ3jC142ns//e2VrP8nvpcUzR3QoDBY2mhoGGrGumFRu4rjU08ThBU47VzPaW95QT+/jWSBkviOX2qfMmiT3HYPWvEfpEVYIemqm/pRG+Ju6Rw1qIc8O0Am8aXkVc8iDfI9zITbBl4RDhBq2ooDjT28+uOeoW6v7TN1AtwSP2MyUmJlbp+fzpbYze1XFFxmx7c9XQ/slF5t2KYaARpKFyHAp90SjziUr7cEdHhSm8FEUfyS7+lIBfzgNp5E/Z22mhMS04n1Beg5/q0kGCjIr//V+hcpCgkXHDcuc2mSk86zoS14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com (2603:1096:203:8b::10)
 by HK0PR06MB3362.apcprd06.prod.outlook.com (2603:1096:203:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 03:44:30 +0000
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::4d49:12fe:2d9a:b1bd]) by HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::4d49:12fe:2d9a:b1bd%3]) with mapi id 15.20.4020.022; Thu, 15 Apr 2021
 03:44:30 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [v2 1/2] dt-bindings: Add bindings for aspeed pwm-tach and pwm.
Thread-Topic: [v2 1/2] dt-bindings: Add bindings for aspeed pwm-tach and pwm.
Thread-Index: AQHXMRveymfOqXW0b0q4pkWKQfA6vaq0lT+AgADh7IA=
Date: Thu, 15 Apr 2021 03:44:29 +0000
Message-ID: <B9287FE7-5EF5-40B3-BCB3-08DA11D6CDD7@aspeedtech.com>
References: <20210414104939.1093-1-billy_tsai@aspeedtech.com>
 <20210414104939.1093-2-billy_tsai@aspeedtech.com>
 <20210414221553.GA56046@robh.at.kernel.org>
In-Reply-To: <20210414221553.GA56046@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 509caba7-2a5f-4c45-7ccf-08d8ffc0c673
x-ms-traffictypediagnostic: HK0PR06MB3362:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB3362ED46E22C4C7783D46DC08B4D9@HK0PR06MB3362.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nfxQEM/dHQoD5MJajZ+vy4OzSKOClqd7XibvnXMScmY7lM9lsa8sP+OcYYPdVsm/CIOwqeL/rmPS63trqiVWNmA+7yZ/Wt0gaRKhxzxvDM8vjTx/JRUt+tpTkNdJG79FjCZTiqWGfet7CVX2rc0Uf4XMOWjYZbY2Dzc1M/QOpsHO8k2owWcv6D0Oag1RfOymOTmDkSgyJHAoXX40SD9wPhB/48ADu+wWo56I2frjviFD/mQ+88fNO/rykXcV4vUHbDyjdKhmG3T6c+YCykEki2jcgKjheVVygmlXtaZgnjxxBoZD+TxBejo7bSrUoHCaUT604Xi/x676mGUqngc46p8CsGH+FOQqAdJUjz7u0sZN+8ncxTBDfWIH+Zr+0fboURAD+JgTJ3BQd3RxQC+Vv5knnWfv0+PmXO2aTkbsUsOdU9KscIfjEAEoxZfwQVgXdvTZPq4JON98GebZLgiYqb3/A2DSBzgGF0Zh7G32Wq4fmAMEF0zmXyGcDd1iXJsAGPf+9G9JtROiH5+sJedjNcmX1BnUQQmCOQja+6X+Hm1vqz/un1oudDDBNI4SvUxQxwhcCO9ypOD+T6XdqfLv9tQrgngzHjJcbI3AmfhYVLdbMLtKmPJFt/6NVt3L+izmRTNl4cFk3/yTFpk+Lj5kfQuy3Yq8nKYFIk7q5ZCUXYQXHJc3b4bL2Vy+d/RIw6B/fxmaIJbki1LLDh50ASa20qI3e3m1FRAg6Eg79XhP0hg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3362.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39840400004)(346002)(136003)(396003)(376002)(8936002)(2616005)(186003)(4326008)(38100700002)(6506007)(76116006)(66446008)(7416002)(83380400001)(966005)(107886003)(66556008)(122000001)(71200400001)(36756003)(8676002)(66946007)(478600001)(6512007)(86362001)(6916009)(54906003)(55236004)(2906002)(26005)(5660300002)(64756008)(33656002)(6486002)(316002)(66476007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?K0pKczZvMEtSUk9TWkNxbTc0MkEzaHlmVXpFMDBWcUFDTGZhMTF3cVVvY0VV?=
 =?utf-8?B?eUNjNWprM2s0djRrUEp0Y2tJTlYrcjdmRGo5eTFvSDZ3SXgrUWlQeUdBWnNx?=
 =?utf-8?B?dTFRV0RxWERZK1d1QUFLVlRjTXI3Njh4UTk0OTBaTGhuWmJmSDBzUVU2dm13?=
 =?utf-8?B?bldFM0JnMVVwR3o2VFR3WUtnMWtYdFFjVTc1MmsweVBMZ2syK0Y1T21hK25p?=
 =?utf-8?B?NzJBZXhFUjE1ZjJBWWdwd203N0V5TVZ1b2paYktneFFlWkpLZG5VRHNXeE5t?=
 =?utf-8?B?UjM1OUlpRmtjK3RiRWxqN1lJaUErTzJkSjluTkRjQlFQMmEvQm1XRE9DU05h?=
 =?utf-8?B?OE9nMStvZGw4MGl3bFlJcldvNENuNTF5Y2tycFMyZytPWDRPaW5DQ0l3L09U?=
 =?utf-8?B?T2YzV3Bpa1BITVRLUFpVbEhkZzhyeDFwT2lBSkdObDZmaC9yb3R4TU5ZNDha?=
 =?utf-8?B?SkFiVm9uZjhVRlBobTN3ZEh6Y2NpbHFFUXdTNHVMVkt5dC9uTFVzbm9kOWc1?=
 =?utf-8?B?dkVRR0JtMTAyaEg4aUJRVjhRVGdRQzdraWpHbjkzWHRaWm1STHFBM1BYSFVx?=
 =?utf-8?B?SkhFMmg4S0Q4ZUZPb21pZ2dLNE8zUzFPUExyaWhVa3NLREdyNmVDeWppblNZ?=
 =?utf-8?B?VW5YQUNWSndqQ3lwL0JmbEpyNzlNNGFoU2Z6TXh0cVlOYmJHK3puT3dROThh?=
 =?utf-8?B?Um9hcXZTdkN1MFNTdmxXRGNPUFdZNUszNjl5RGhtVVQzT2N6Rno5d0xkem9H?=
 =?utf-8?B?eEVtNjUvTkxUMUFrM1EvcXlMQzZOaUFRS3R6dTY4U056a1V6SU5VZlBobm5n?=
 =?utf-8?B?WmhRRm5lY0dkbUY2c0h4ckdaUFVYcHkrNEpsanViNDJiVDdKSjQrMk96TFlN?=
 =?utf-8?B?ZHNtTUZSRTJJZllQck1TN0p0cmZjT29VSFJZemUrY1JKWjBnVHBxWEZFUkpN?=
 =?utf-8?B?M1pkZUFFYVpxeXkrNEcwbndFWUlMY29QSi9PSjBZLzJERG9Lc1RYV0haY1ZQ?=
 =?utf-8?B?aDVxT1JLRjFVRVZ6amFWL0NySHZPWkRrL2hjTXVXMTczTE9oUGNFYVhrVjFs?=
 =?utf-8?B?aWxDc1pYNVZ5L0hhL3pUcnBxT0k2MVR3Rm5rclRNdHB6alcvbFdSOW04cjRD?=
 =?utf-8?B?dTY2dzI5V1pOay9qY0FoTldwZzFmSXpsZXlhYWhWQkVoaU9NWTB0bHovL3cx?=
 =?utf-8?B?WVh5U25laHJnNnd3MXV1WnlXaFJwUTVlVWZLOE1NaEw1UjBPbHFhbVoyMU4x?=
 =?utf-8?B?dk82QTREMWUreWY4UnVyT0Nremgrc3p1NEwyeXl4V1hUOER5cUpYbXlkRG1H?=
 =?utf-8?B?TmIya1d6TFlMaThZeGlzbytyQ2JkaTMyZ3pMV2o5eTdmL25ZVWF0UnFpTTV6?=
 =?utf-8?B?QUdwakRlbjR2cE1zNnZHQldJK3BXVHQxRU1OaVJmZERUR2RoeDNuTC9sV1U5?=
 =?utf-8?B?MzNQNUIxcjNsclh3bUVsUGp0QjM5cnBkcFo3QWl6RkowaGNRa3NYNzdsRlgz?=
 =?utf-8?B?UStyelBQbnVFUUg2VkRVZnFnSXg2MzdWcDkvZTVtNzEvRUxUVlVMWllPV2Qw?=
 =?utf-8?B?SmpReVhBTTZiWDdicTlXbGJFeTdPNThvTE9RNkphOEVNejFRaGZyenNmNWtU?=
 =?utf-8?B?U1FTZnJ6T25UY0d3TmtsMVg2WUtOZmkyWmIwbnZiQ082YittOWdTL1JhdGVu?=
 =?utf-8?B?c1B6dHpuQm9KRnRTdkFqejdzclAzck1NTDVtcHZLc3ExcGtTTlVnY2hGQTZu?=
 =?utf-8?Q?11AEkkUYRVrO5c9nfX7X0lMhzSg36vi9MQYcLpw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9942EB53D3348D4EBB01D175B4BB5843@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3362.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509caba7-2a5f-4c45-7ccf-08d8ffc0c673
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 03:44:29.8487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WOgiLvGvqzGfkhcymoolZqS7cYplnbRvOhA5Gl5BfzIcAJjTUTnGTujq5CVNICpgdrYKFp5QK62Zx1+pWJbnOj57SQ4pFQS8+libSJl3iIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3362
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgUm9iLA0KDQpPbiAyMDIxLzQvMTUsIDY6MTYgQU0sUm9iIEhlcnJpbmd3cm90ZToNCg0KICAg
IE9uIFdlZCwgQXByIDE0LCAyMDIxIGF0IDA2OjQ5OjM4UE0gKzA4MDAsIEJpbGx5IFRzYWkgd3Jv
dGU6DQogICAgPj4gVGhpcyBwYXRjaCBhZGRzIGRldmljZSBiaW5kaW5ncyBmb3IgYXNwZWVkIHB3
bS10YWNoIGRldmljZSB3aGljaCBpcyBhDQogICAgPj4gbXVsdGktZnVuY3Rpb24gZGV2aWNlIGlu
Y2x1ZGUgcHduIGFuZCB0YWNoIGZ1bmN0aW9uIGFuZCBwd20gZGV2aWNlIHdoaWNoDQogICAgPj4g
c2hvdWxkIGJlIHRoZSBzdWItbm9kZSBvZiBwd20tdGFjaCBkZXZpY2UuDQogICAgPj4gDQogICAg
Pj4gU2lnbmVkLW9mZi1ieTogQmlsbHkgVHNhaSA8YmlsbHlfdHNhaUBhc3BlZWR0ZWNoLmNvbT4N
CiAgICA+PiBDaGFuZ2UtSWQ6IEkxOGQ5ZGVhMTRjM2EwNGUxYjdlMzhmZmVjZDQ5ZDQ1OTE3Yjli
NTQ1DQogICAgPg0KICAgID5Ecm9wDQogICAgPg0KICAgID4+IC0tLQ0KICAgID4+ICAuLi4vYmlu
ZGluZ3MvbWZkL2FzcGVlZCxhc3QyNjAwLXB3bS10YWNoLnlhbWwgfCA2MCArKysrKysrKysrKysr
KysrKysrDQogICAgPj4gIC4uLi9iaW5kaW5ncy9wd20vYXNwZWVkLGFzdDI2MDAtcHdtLnlhbWwg
ICAgICB8IDQ0ICsrKysrKysrKysrKysrDQogICAgPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTA0IGlu
c2VydGlvbnMoKykNCiAgICA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZmQvYXNwZWVkLGFzdDI2MDAtcHdtLXRhY2gueWFtbA0KICAgID4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3
bS9hc3BlZWQsYXN0MjYwMC1wd20ueWFtbA0KICAgID4+IA0KICAgID4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2FzcGVlZCxhc3QyNjAwLXB3bS10
YWNoLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2FzcGVlZCxh
c3QyNjAwLXB3bS10YWNoLnlhbWwNCiAgICA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KICAgID4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uZWFmOGJkZjhkNDRlDQogICAgPj4gLS0tIC9kZXYvbnVsbA0K
ICAgID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXNwZWVk
LGFzdDI2MDAtcHdtLXRhY2gueWFtbA0KICAgID4+IEBAIC0wLDAgKzEsNjAgQEANCiAgICA+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
DQogICAgPj4gKyMgQ29weXJpZ2h0IChDKSAyMDIxIEFTUEVFRCwgSW5jLg0KICAgID4+ICslWUFN
TCAxLjINCiAgICA+PiArLS0tDQogICAgPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvbWZkL2FzcGVlZCxhc3QyNjAwLXB3bS10YWNoLnlhbWwjDQogICAgPj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KICAgID4+ICsN
CiAgICA+PiArdGl0bGU6IFBXTSBUYWNoIGNvbnRyb2xsZXIgRGV2aWNlIFRyZWUgQmluZGluZ3MN
CiAgICA+PiArDQogICAgPj4gK2Rlc2NyaXB0aW9uOiB8DQogICAgPj4gKyAgVGhlIFBXTSBUYWNo
IGNvbnRyb2xsZXIgaXMgcmVwcmVzZW50ZWQgYXMgYSBtdWx0aS1mdW5jdGlvbiBkZXZpY2Ugd2hp
Y2gNCiAgICA+PiArICBpbmNsdWRlczoNCiAgICA+PiArICAgIFBXTQ0KICAgID4+ICsgICAgVGFj
aA0KDQogICAgPiBCdXQgaXMgaXQgcmVhbGx5PyBBIFBXTSBhbmQgdGFjaCBzb3VuZHMgbGlrZSBh
IGZhbiBjb250cm9sbGVyLiBMb29rIGF0IA0KDQpPdXIgUFdNIGlzIG5vdCBvbmx5IGZvciBmYW5z
IGJ1dCBhbHNvIHVzZWQgZm9yIHRoZSBtb3RvciwgbGVkLCBidXp6ZXIsIGFuZCBzbyBvbi4gDQpT
byBJIHdhbnQgdG8gc3BsaXQgdGhlIGZ1bmN0aW9uIGludG8gdHdvIGRldmljZXMgd2l0aCBhIG11
bHRpLWZ1bmN0aW9uIGRldmljZS4gDQpPbmUgZm9yIFBXTSBvdXRwdXQgYW5kIG9uZSBmb3IgdGFj
aCBtb25pdG9yLg0KDQogICAgPiBvdGhlciBleGlzdGluZyBQV00rdGFjaCBiaW5kaW5ncyB3ZSBo
YXZlIGZvciBmYW5zLg0KDQpJIGRpZG4ndCBzZWUgdGhlIFBXTSt0YWNoIGJpbmRpbmdzIGNhbiB5
b3UgZ2l2ZSBzb21lIGV4YW1wbGUgZm9yIG1lLCB0aGFua3MuDQoNCiAgICA+PiArDQogICAgPj4g
K21haW50YWluZXJzOg0KICAgID4+ICsgIC0gQmlsbHkgVHNhaSA8YmlsbHlfdHNhaUBhc3BlZWR0
ZWNoLmNvbT4NCiAgICA+PiArDQogICAgPj4gK3Byb3BlcnRpZXM6DQogICAgPj4gKyAgY29tcGF0
aWJsZToNCiAgICA+PiArICAgIGl0ZW1zOg0KICAgID4+ICsgICAgICAtIGVudW06DQogICAgPj4g
KyAgICAgICAgICAtIGFzcGVlZCxhc3QyNjAwLXB3bS10YWNoDQogICAgPj4gKyAgICAgIC0gY29u
c3Q6IHN5c2Nvbg0KICAgID4+ICsgICAgICAtIGNvbnN0OiBzaW1wbGUtbWZkDQogICAgPj4gKyAg
cmVnOg0KICAgID4+ICsgICAgbWF4SXRlbXM6IDENCiAgICA+PiArICAiI2FkZHJlc3MtY2VsbHMi
Og0KICAgID4+ICsgICAgY29uc3Q6IDENCiAgICA+PiArICAiI3NpemUtY2VsbHMiOg0KICAgID4+
ICsgICAgY29uc3Q6IDENCiAgICA+PiArDQogICAgPj4gK3JlcXVpcmVkOg0KICAgID4+ICsgIC0g
Y29tcGF0aWJsZQ0KICAgID4+ICsgIC0gcmVnDQogICAgPj4gKyAgLSAiI2FkZHJlc3MtY2VsbHMi
DQogICAgPj4gKyAgLSAiI3NpemUtY2VsbHMiDQogICAgPj4gKw0KICAgID4+ICthZGRpdGlvbmFs
UHJvcGVydGllczoNCiAgICA+PiArICB0eXBlOiBvYmplY3QNCg0KICAgID4gQXMgeW91IGtub3cg
dGhlIDIgbm9kZSBuYW1lcywgdGhleSBzaG91bGQgYmUgZG9jdW1lbnRlZC4gSG93ZXZlciwgc2Vl
IA0KICAgID4gYmVsb3cuDQoNCiAgICA+PiArDQogICAgPj4gK2V4YW1wbGVzOg0KICAgID4+ICsg
IC0gfA0KICAgID4+ICsgICAgcHdtX3RhY2g6IHB3bV90YWNoQDFlNjEwMDAwIHsNCiAgICA+PiAr
ICAgICAgY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1wd20tdGFjaCIsICJzeXNjb24iLCAi
c2ltcGxlLW1mZCI7DQogICAgPj4gKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgID4+
ICsgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCiAgICA+PiArICAgICAgcmVnID0gPDB4MWU2MTAw
MDAgMHgxMDA+Ow0KICAgID4+ICsNCiAgICA+PiArICAgICAgcHdtOiBwd21AMCB7DQogICAgPj4g
KyAgICAgICAgY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1wd20iOw0KICAgID4+ICsgICAg
ICAgICNwd20tY2VsbHMgPSA8Mz47DQogICAgPj4gKyAgICAgICAgcmVnID0gPDB4MCAweDEwMD47
DQogICAgPj4gKyAgICAgIH07DQogICAgPj4gKw0KICAgID4+ICsgICAgICB0YWNoOiB0YWNoQDEg
ew0KICAgID4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtdGFjaCI7DQog
ICAgPj4gKyAgICAgICAgcmVnID0gPDB4MCAweDEwMD47DQoNCiAgICA+IFlvdSBoYXZlIDIgbm9k
ZXMgYXQgdGhlIHNhbWUgYWRkcmVzcy4gTm90IHZhbGlkLg0KDQpPdXIgcHdtIGFuZCB0YWNoIGlz
IHVzZWQgdGhlIHNhbWUgYmFzZSBhZGRyZXNzIGFuZCB0aGUgb2Zmc2V0IGlzIGxpa2UgYmVsb3c6
DQoNClBXTTAgdXNlZCAweDAgMHg0LCBUYWNoMCB1c2VkIDB4OCAweGMNClBXTTEgdXNlZCAweDEw
IDB4MTQsIFRhY2gxIHVzZWQgMHgxOCAweDFjDQouLi4NCg0KSSB3aWxsIHJlbW92ZSB0aGUgcmVn
IHByb3BlcnR5IGZyb20gcHdtIGFuZCB0YWNoIG5vZGUgYW5kIHJlbW92ZSB0aGUgIiNhZGRyZXNz
LWNlbGxzIiBhbmQNCiIjc2l6ZS1jZWxscyIgZnJvbSB0aGUgcGFyZW50IG5vZGUuDQoNCiAgICA+
PiArICAgICAgfTsNCg0KICAgID4gVGhlcmUncyBubyByZWFsIG5lZWQgZm9yIDIgY2hpbGQgbm9k
ZXMuIFRoZSBwYXJlbnQgbm9kZSBjYW4gYmUgYSBQV00gDQogICAgPiBwcm92aWRlci4NCg0KSG93
ZXZlciwgSW4gb3VyIHVzYWdlLCB0aGUgcGFyZW50IG5vZGUgaXMgYSBtZmQsIG5vdCBhIHNpbXBs
ZSBQV00gZGV2aWNlIG9ubHkuIEkgZG9uJ3Qgd2FudCB0bw0KY29tYmluZSB0aGUgZGlmZmVyZW50
IGZ1bmN0aW9ucyB3aXRoIHRoZSBvbmUgZGV2aWNlIG5vZGUuDQoNCg0KICAgID4+ICsgICAgfTsN
CiAgICA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3
bS9hc3BlZWQsYXN0MjYwMC1wd20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wd20vYXNwZWVkLGFzdDI2MDAtcHdtLnlhbWwNCiAgICA+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KICAgID4+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTc5MjNlNjhjY2I5DQogICAgPj4gLS0t
IC9kZXYvbnVsbA0KICAgID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wd20vYXNwZWVkLGFzdDI2MDAtcHdtLnlhbWwNCiAgICA+PiBAQCAtMCwwICsxLDQ0IEBADQog
ICAgPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQ0KICAgID4+ICsjIENvcHlyaWdodCAoQykgMjAyMSBBU1BFRUQsIEluYy4NCiAgICA+
PiArJVlBTUwgMS4yDQogICAgPj4gKy0tLQ0KICAgID4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL3B3bS9hc3BlZWQsYXN0MjYwMC1wd20ueWFtbCMNCiAgICA+PiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQogICAgPj4g
Kw0KICAgID4+ICt0aXRsZTogQVNQRUVEIEFTVDI2MDAgUFdNIGNvbnRyb2xsZXINCiAgICA+PiAr
DQogICAgPj4gK21haW50YWluZXJzOg0KICAgID4+ICsgIC0gQmlsbHkgVHNhaSA8YmlsbHlfdHNh
aUBhc3BlZWR0ZWNoLmNvbT4NCiAgICA+PiArDQogICAgPj4gK2Rlc2NyaXB0aW9uOiB8DQogICAg
Pj4gKyAgVGhlIEFTUEVFRCBQV00gY29udHJvbGxlciBjYW4gc3VwcG9ydCB1cHRvIDE2IFBXTSBv
dXRwdXRzLg0KICAgID4+ICsNCiAgICA+PiArcHJvcGVydGllczoNCiAgICA+PiArICBjb21wYXRp
YmxlOg0KICAgID4+ICsgICAgZW51bToNCiAgICA+PiArICAgICAgLSBhc3BlZWQsYXN0MjYwMC1w
d20NCiAgICA+PiArDQogICAgPj4gKyAgIiNwd20tY2VsbHMiOg0KICAgID4+ICsgICAgY29uc3Q6
IDMNCiAgICA+PiArDQogICAgPj4gKyAgcmVnOg0KICAgID4+ICsgICAgbWF4SXRlbXM6IDENCiAg
ICA+PiArDQogICAgPj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KICAgID4+ICsNCiAg
ICA+PiArZXhhbXBsZXM6DQogICAgPj4gKyAgLSB8DQogICAgPj4gKyAgICAvLyBUaGUgUFdNIHNo
b3VsZCBiZSBhIHN1Ym5vZGUgb2YgYSAiYXNwZWVkLGFzdDI2MDAtcHdtLXRhY2giIGNvbXBhdGli
bGUNCiAgICA+PiArICAgIC8vIG5vZGUuDQogICAgPj4gKyAgICBwd21fdGFjaDogcHdtX3RhY2hA
MWU2MTAwMDAgew0KICAgID4+ICsgICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXB3
bS10YWNoIiwgInN5c2NvbiIsICJzaW1wbGUtbWZkIjsNCiAgICA+PiArICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQogICAgPj4gKyAgICAgICNzaXplLWNlbGxzID0gPDE+Ow0KICAgID4+ICsg
ICAgICByZWcgPSA8MHgxZTYxMDAwMCAweDEwMD47DQogICAgPj4gKw0KICAgID4+ICsgICAgICBw
d206IHB3bUAwIHsNCiAgICA+PiArICAgICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAw
LXB3bSI7DQogICAgPj4gKyAgICAgICAgI3B3bS1jZWxscyA9IDwzPjsNCiAgICA+PiArICAgICAg
ICByZWcgPSA8MHgwIDB4MTAwPjsNCiAgICA+PiArICAgICAgfTsNCiAgICA+PiArICAgIH07DQog
ICAgPj4gLS0gDQogICAgPj4gMi4yNS4xDQogICAgPj4NCg0K
