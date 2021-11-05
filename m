Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2651944678D
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 18:10:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm6Sk6dGqz3053
	for <lists+linux-aspeed@lfdr.de>; Sat,  6 Nov 2021 04:09:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=geA9QSeS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=geA9QSeS; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm6SZ0ggpz2ymw
 for <linux-aspeed@lists.ozlabs.org>; Sat,  6 Nov 2021 04:09:44 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="231787877"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="231787877"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 10:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="450859239"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 05 Nov 2021 10:05:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 10:05:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 5 Nov 2021 10:05:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 5 Nov 2021 10:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsgNgJeRxRNLKA3BCEUdDTF/FBy+NS1ehdLZEa3JgU5YyAz//CgPWViA3yJ/vWYNUljBEZW3EJ9sOZA+nP2IdcdH6VL3HpMyvRVEzA3MTcKF5l5LRDmrfLSSrmetlALdZKeRbbOz5gHwinaV6VNUvd0emJgcK6CSPYvkj17IcIYPIZGQiZmeRDDwE54mBCKkIIhyq/een0lXdjdLEL6yIursCishcleoCWHKd3CZMChO2Wh/5ky4VjMJDx9zKBRKSvjT3cRPG6FgLC7sWeAWDH53WkTfs+WsGdlUfJidLjj95gtDodR96HGXuwqFIJalMK1begXY1K8bbEx7ujW2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyildGta75QCublPcRTolXYsqEY3seGzMriXPyirdY0=;
 b=DvUaX5C69zFmRw9RGCUT3eKbPvCn9ghpCRdbAw5jTtcG5nwWNpSIs8I+o48zeQRMS/FMeaKuYHnDEZX7RHOv4Ig3Ms0zUs/4e0bhgm5ERPqBrLWtNxyAU1H4m1UyoG0vq6RF9iiKGiUSfQMtqcJr8vhiSPFq4stWSw0r3F7ffKRofJgQObXM9XASiBtl/chRKkYJUGzF0J4vE88zT1t7BF2Qp12/9Q9QoATIkrAty78v2GwiZ5aQBJ8Py8l8moi1a2tSQrutft7VGnJia5k6BJ/C2638CroYlnCVr5HV2xQrjxtAGikjbwP7L9HER47NwBVIncKsEQ5eQ7HIYXqDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyildGta75QCublPcRTolXYsqEY3seGzMriXPyirdY0=;
 b=geA9QSeSPreq/whJrjaeEOfCm3yQh7yvAj9wQu9q+WdAdfWDE9L3T6rllKWcsH0xQIoqyxx8P+IUVLgMxMtaZFD8ZKHSmU8429AhWabM5o5qqbqC+uJ/yZB4SuEK2dmBmCTInaJ1C414rHUsK2ez6nnHooCAyL0LZvinrXFb0Gs=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MWHPR11MB1246.namprd11.prod.outlook.com (2603:10b6:300:29::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 5 Nov
 2021 17:05:19 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%5]) with mapi id 15.20.4649.019; Fri, 5 Nov 2021
 17:05:18 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Yoo, Jae Hyun" <jae.hyun.yoo@intel.com>, "yangyingliang@huawei.com"
 <yangyingliang@huawei.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "jae.hyun.yoo@linux.intel.com"
 <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v2] soc: aspeed: lpc-ctrl: Block error printing on probe
 defer cases
Thread-Topic: [PATCH v2] soc: aspeed: lpc-ctrl: Block error printing on probe
 defer cases
Thread-Index: AQHX0Z/jvco+duBIU0C6+5Ms0dmSuqv1K12A
Date: Fri, 5 Nov 2021 17:05:18 +0000
Message-ID: <6057e8fe3bc84c719e0dc3cc4753a472ac92a8bf.camel@intel.com>
References: <20211104173709.222912-1-jae.hyun.yoo@intel.com>
In-Reply-To: <20211104173709.222912-1-jae.hyun.yoo@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20631994-f63c-4d96-622e-08d9a07e7205
x-ms-traffictypediagnostic: MWHPR11MB1246:
x-microsoft-antispam-prvs: <MWHPR11MB12469DA6FB55FD8CDE4744FFEC8E9@MWHPR11MB1246.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wt73XCpmhDPUzsjExGc2Dc7vkVQ2kmINJAQfcaECJFlx8Y6nnBO9TuL/OH2E398fvK6xlrowVe6kfKCOWBQP572Pyc1Y9vHvNo142tnQiwarN+dpmhJVWtALkND0fZmTivLQD/5SR6K3Q4CFd2dh8DvpmbNKfP0EpQiKQyJaCJN8PnKHdtQY4lhtx9v8E6ytDz5Atw8u97QIbS5AbZqRYJNQlDRP6IMkLS5pzRFHRLtaRcW9hh/uCEsNsU9hiWK5UV3Q7ppvMHKVU8KZVZNrXpDZSWnUKoJnj4eeYOy43vXTRvOkpuzTp0t7QsuqoJ3NOl1w/nfeSy4Hc+Y6IJd8DyL5EAS2Ut3jo7PHzUSgVg8xQFfUhLPiWOH9qhFy7wP/lDW/VHRVjhPYQAFasCe8+s3nutUC3jpGhibhiBcMQ8z3fXcsDb02Apcouk9LhHjV+Ef5Vg8RjRup+Fh11FtjiGRMwhWQCUXossvsGLDsPyIWIuO0vKl0wqMA26EEy5BDbjqgGRNt/Kh8HxTQL3zrEgK5CXE/JiNevicpQIZ56hkthkUBMsqk2Jt4o9oYNWx1HoYH1UVTcLgUjajrBSTnTCXEUQVzGCFJEHz4qQt1t9Sl+IB/vtBRrNBMbmAmaq8lEcS/pIV1jFfLafKEaZM6+2TXa9w7CAFwOHs0ZRquj3mQfus7uHH8hSqBlMgFo5CRfLA/OxEkqDn9zLj12U18mA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66476007)(5660300002)(64756008)(2906002)(2616005)(66556008)(4326008)(83380400001)(91956017)(6506007)(122000001)(66446008)(38100700002)(38070700005)(76116006)(316002)(82960400001)(71200400001)(110136005)(54906003)(36756003)(8936002)(508600001)(6512007)(186003)(6486002)(8676002)(26005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGZrTGRLYzV2eExldVE3QWxneUNIeDRXNGpCb2JDOGF0UmxLdW9XNFB0b01R?=
 =?utf-8?B?TGNIVVJ3VzNmblllRmpXd1NxcVROV21mejh2eFNHUnBSV3U2NWw4V0hWek1Y?=
 =?utf-8?B?WGNsMURJbzE3cXI3T0dsRTNLUVFLZDhyWFJqRmh1NVA0S1FkYlhjNVBUaUNK?=
 =?utf-8?B?SEZ1VmxGMnovOHNiSzJYUElyTU9pRFBZSWw3cGgwWXZHQTRQUWovUHBEMjZz?=
 =?utf-8?B?WWZhWlNhQ2R0eTRRVEFoVWN4M05GSG1vSGtORWZ1NXFTczhWOHZsSGk5eG9W?=
 =?utf-8?B?NmxWLy9kaUxFVyt0dzExMlZSaHRHOEh5ekpoUElVZUJHR2VwbmNmdFlYbnAx?=
 =?utf-8?B?MjN6Y0lLSGwrSk9MeG9WVG55ZTEwcUY5MW9ubkZtYmVEUXkxRWVodllpdlBx?=
 =?utf-8?B?UXlGbWVnaUhTOHBiZTUzMlcrbDR2ZGJJL2JzUE9qNUpKRTlhbFN6dnpVY1JO?=
 =?utf-8?B?aWFjSzdJM3dublQ1OHV0TVhwNms2dExaaFAxL3pRQ0xseWYwN3FXcURUdXhw?=
 =?utf-8?B?TkRDVG5pR1hkbnZDdHpua2haWnRONWxnckRuRWFKMDhEdEUyU2hWZUVDeEtJ?=
 =?utf-8?B?aXVzOXozOFdLNENoUkppMVA5NnVYTzl1NllMYVptV1lrSjhNbVpnK25ZYlEv?=
 =?utf-8?B?Zi9MN0FtL3l3R3lMTW9tNWQ4cGtPam5qRkdpdytla1Rldy95Q0NsbFE4RWlS?=
 =?utf-8?B?bkNzNFZFaGM3YVEzK3NPWWVKZ3Y1SEthLzREVkd1SUlWNFBnbTJ4OEprSWp4?=
 =?utf-8?B?Uk12MW0xR3VrNEx3R3JyeTFSSnN2U3d3dWdPMjh4emhubTlFWUNPVFZBZURD?=
 =?utf-8?B?OVlxNzJPRlJiQjN6YTB6SGpRVnhLREF4Vk1oNTZZL3A0d2FWTW4zTnBVM2V5?=
 =?utf-8?B?VHMzNjVNTWZCYWQxaG1RNFZEZ0QzdFpUbXZwV2VBUVNUYjNXemRPaHFlWHBI?=
 =?utf-8?B?TVdxbktMQ1N5Yk1yajZFVm5QK0pGVll5cmFvV2tBaS9vVnBkSWtMNndVOUJG?=
 =?utf-8?B?T1p3Y1BFYng3bm0wUzUzT0d4TXIxOHhsaUdBSzFkYWgwVTFzWGg4R3NXT01r?=
 =?utf-8?B?M0VhSDloMDRoQmlUMDE4NW5nR3prNnVpeDBFcnI5TzNrdk9DdjBOdU9BMC84?=
 =?utf-8?B?TnZKU1JwbWNOQ1lPTStEa3NtcGZFdGN2TFRONGlDYTdyWHl0bXlsYkZyckhm?=
 =?utf-8?B?YjVvVkdNVVFvRThDMW1OdVQ4Uk1YckxReWpobmptc0srTmRGVUxjbmwrbUQ1?=
 =?utf-8?B?d2N4RmlHRngxU3pOc1VyZ3VzT2RnUmdrOHFkdmFWN1dSTlRDUEJrQjVhUE0r?=
 =?utf-8?B?Z1E0RFRib3dyYmNPMUxUak92bWVwMkVMZnlpVGdmclk0MGNWR1VyS3RCN1h6?=
 =?utf-8?B?ZG5TNWlYTGZJdlE0L1R4cWpqZmFGZ0JNVnNnRStrSm50aUZlQTVES2N1Uk5x?=
 =?utf-8?B?OGdxT1g5eGJ6L2RRK3gxc0dsaG9JYXpvcUFzSEFlTzIyQVBCUTRxbXdQMkVY?=
 =?utf-8?B?KzVEaVpGanFyOUdrdVRyU2UwV3diVHpIaE9heloxTWZJOVNMb0E5K1k5aWxv?=
 =?utf-8?B?NEJ6MnhuZGNMM091eHMzMEZsKzZTWmRsK2FrTExNWmwxcSs4UWE4NzJOQWZs?=
 =?utf-8?B?dlF6MStHSHRkMWFOWll5dmQveTdkWFNKZ0JvREZsaGFMRUMzbGJQeTJ0MjAv?=
 =?utf-8?B?dVlOZ25BZmlpdFBtekRlUmNVd2J0Y2kwdTdwVWs4NndvZGZ5SUphemd1VTQy?=
 =?utf-8?B?TFNnd1JPRkl0eUg3WTF6eXVzd01CdVRhd3pEZk9jdFIvdThpdWtpbWpYTm1u?=
 =?utf-8?B?U2dQVG5HbVM1VGxjS1R2bEY3WkZ5WkNtdG5za3ZzUzJFVXZiMitudTZYNWd3?=
 =?utf-8?B?aTdBOUZXejQzVHJ3QVVPRWIyd29IdllIeExHeXNyNExIdHZoKytPOEIvdG0w?=
 =?utf-8?B?Y05UOHJnS3RTOVM4WW5oejZCMFl6ZGUyajM2L2RYL1dmTVpGZFhzdW84eFp1?=
 =?utf-8?B?VEZiQW85QTI2ZGtBcXA0MkpkRkxrVnBXMXJlOWRRbmJFTjJxZXZPQU5XS3o0?=
 =?utf-8?B?OGUwQ0lta3BiR1ZqUVB5TVdDZUFWMUp1K0VMdHY0SmgyMFB2bm1KTUpVS2pC?=
 =?utf-8?B?ZTFmTTNDU1E3clVidDdieWVGN2NQT3FjRXJZd3JRNDRhblJlbjRDSkNUakRa?=
 =?utf-8?B?ZkVwU1M5QWd5OXR0V0pZMEI1cllUMjBWUTQvQStOdjNGc3Z2eG4xZStKaUhu?=
 =?utf-8?Q?JlP7pXCTLbMTDDVYcmhivHuXezvWfhcZrnppLwrXv4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDFA564C5EE0E346B2DD4E9C71814730@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20631994-f63c-4d96-622e-08d9a07e7205
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 17:05:18.7690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6am/9P7RIInjHnVNkaxydfJasLqYIjVx/hifljqePW+85Tyf1bvmFjTDtzCuWp7QJJfGuCnHTpB/A0tYCvUDjE9zLya68WXoNDG8jjqwTVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1246
X-OriginatorOrg: intel.com
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIxLTExLTA0IGF0IDEwOjM3IC0wNzAwLCBqYWUuaHl1bi55b29AaW50ZWwuY29t
IHdyb3RlOgo+IEZyb206IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNv
bT4KPiAKPiBBZGQgYSBjaGVja2luZyBjb2RlIHdoZW4gaXQgZ2V0cyAtRVBST0JFX0RFRkVSIHdo
aWxlIGdldHRpbmcgYSBjbG9jawo+IHJlc291cmNlLiBJbiB0aGlzIGNhc2UsIGl0IGRvZXNuJ3Qg
bmVlZCB0byBwcmludCBvdXQgYW4gZXJyb3IgbWVzc2FnZQo+IGJlY2F1c2UgdGhlIHByb2Jpbmcg
d2lsbCBiZSByZS12aXNpdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8amFl
Lmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBJd29uYSBXaW5pYXJza2Eg
PGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+CgotSXdvbmEKCj4gLS0tCj4gdjEgLT4gdjI6Cj4g
wqAqIFNpbXBsaWZpZWQgaXQgdXNpbmcgZGV2X2Vycl9wcm9iZS4gKEl3b25hKQo+IAo+IMKgZHJp
dmVycy9zb2MvYXNwZWVkL2FzcGVlZC1scGMtY3RybC5jIHwgNyArKystLS0tCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWxwYy1jdHJsLmMgYi9kcml2ZXJzL3NvYy9hc3Bl
ZWQvYXNwZWVkLQo+IGxwYy1jdHJsLmMKPiBpbmRleCA3Mjc3MWUwMThjNDIuLjI1ODg5NGVkMjM0
YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWxwYy1jdHJsLmMKPiAr
KysgYi9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWxwYy1jdHJsLmMKPiBAQCAtMzA2LDEwICsz
MDYsOSBAQCBzdGF0aWMgaW50IGFzcGVlZF9scGNfY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlCj4gKnBkZXYpCj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqBscGNfY3RybC0+Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7Cj4gLcKgwqDCoMKgwqDC
oMKgaWYgKElTX0VSUihscGNfY3RybC0+Y2xrKSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBkZXZfZXJyKGRldiwgImNvdWxkbid0IGdldCBjbG9ja1xuIik7Cj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBQVFJfRVJSKGxwY19jdHJsLT5jbGspOwo+IC3C
oMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGxwY19jdHJsLT5jbGsp
KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIFBUUl9FUlIobHBjX2N0cmwtPmNsayksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImNvdWxkbid0IGdl
dCBjbG9ja1xuIik7Cj4gwqDCoMKgwqDCoMKgwqDCoHJjID0gY2xrX3ByZXBhcmVfZW5hYmxlKGxw
Y19jdHJsLT5jbGspOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmMpIHsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGRldl9lcnIoZGV2LCAiY291bGRuJ3QgZW5hYmxlIGNsb2NrXG4i
KTsKCg==
