Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D7444B3A
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 00:06:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl2TR0wNWz2y7X
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 10:06:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=HFCDGwJd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=HFCDGwJd; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl2TD6CJpz2xXG
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 10:06:34 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="218521747"
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="218521747"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 16:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="600079890"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 03 Nov 2021 16:05:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Nov 2021 16:05:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 3 Nov 2021 16:05:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 3 Nov 2021 16:05:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC1ANra6yBuYjw5yUposYvUoIKiI4yKa+/SSCce9evuUPNFUJbZbG/JlSN/LI3WDsBzWNS2RVGK+XXmRCfZdEgsEnUQAUk2xelwqRxPG5XBQE6golGnZ67N/OwY9xlJqYwyrfd7nb30XwdrYn5oCg57BlvSfrEFFTn29iCIOFxAVWVWsF/sYII/1dPaq6Xqzz+Fo8GJ7bq92pizOZCpjb9SQuSO/GHJOQuXFxyHCAWQQfZb4W0wqMaiCXmCmxNAeERd8FfOjZ+jB/LfNwSeGOG0G7daR8+4AiD32x8WhrnT/FW1CIL5o4eNavyShLQgF6ry/UBEbg6SY9OG6/uldBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vlb/x/0nE+oCvXSZYkTd5B/YA4hkCqFb/AfmsIPylE=;
 b=jNQ6Kp1gttsU/AR4326LTo9pjEq4xEFGa2c2oU0Yn+iZHoDYMhfrwYAoXM+LQrvR3eH1oe/mbJahiwvCexXJn8n1vKYxEuX48zwO1xpHVDNw/th9sqMXoC+dBQqB+Cb6QA2vohxbZ0tr1vrWhSLTe7CqaZd1HIKQcyQk4mfc1+naOSk4l/L9KgAzlNZkQzug34SZlM/IF6Z8xg7R+SA+RbKFQy+4LnSSQopUoe2I5DMmRF8kbNmKfB6NVROlTmYu+TAuIi9ev1acihVORFqfmLlKFAaIT2wXGXJpPvvobNxmkQBmsrywspl/v6jUihWlTsND6bfhJ4PeroBTorMIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vlb/x/0nE+oCvXSZYkTd5B/YA4hkCqFb/AfmsIPylE=;
 b=HFCDGwJdHHF8SgkwbT9PiONd26BlqmCnGtw9AssK8binytEpvQUQ9+GhU/0WkYZSxNmW2vvLNsPlnI0AlxaYHQYYI625hY/1zpdnTesfx285LOm4XlTopOAYyuASyA/E9R5pFpfitJt/CM4/K0lZzd1IVkTeNWaazOxNMXH0028=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MWHPR11MB1805.namprd11.prod.outlook.com (2603:10b6:300:114::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 23:05:27 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%5]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 23:05:27 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Yoo, Jae Hyun" <jae.hyun.yoo@intel.com>, "yangyingliang@huawei.com"
 <yangyingliang@huawei.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "jae.hyun.yoo@linux.intel.com"
 <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH] soc: aspeed: lpc-ctrl: Block error printing on probe
 defer cases
Thread-Topic: [PATCH] soc: aspeed: lpc-ctrl: Block error printing on probe
 defer cases
Thread-Index: AQHX0PqzK51CX9sBB0+wzTfcTMYuVqvybJgA
Date: Wed, 3 Nov 2021 23:05:27 +0000
Message-ID: <7e0bcb8b36bd6af1cadd30a18bf5e28d48b80c0c.camel@intel.com>
References: <20211103215430.192229-1-jae.hyun.yoo@intel.com>
In-Reply-To: <20211103215430.192229-1-jae.hyun.yoo@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b580789-472b-4903-3085-08d99f1e6ce2
x-ms-traffictypediagnostic: MWHPR11MB1805:
x-microsoft-antispam-prvs: <MWHPR11MB1805E1DCEC807AC2CD4BA8CBEC8C9@MWHPR11MB1805.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KoqimQDOs+cL9HyrW4vEjOELEIdk7/VHrDdH+qVHpqD+Q5pIy/msezjWWcE64+FzsUCIE541rOaKNYM4Q7LzAmoH+OnDRRT3n6DwNWAYWltfnI+rgdXSxqUOpEiqhTIc9ab+6MU28Bxer01eW0Vjxt4c7XHjuXbPU5ebW1abjfIhu1Otut15XOvB/vTNGje/+1prPEzT3PgluZ1NB03uAeW9XCTk550Dxtn+En1qFwEnCOdnM7tO7EFS9QKK88lU3Mz4Kn3xyoo0mTxSKGpS9LWYRuwj7sDI+ihLr7dp+LNeFkTP/MJwb228FIQNyhbOjDzDBqNtbvYDvM0swDMJJiVEEFKdjclT7Fa4wMyQ5PsOCRAaTHKQvtCa63e3u75mtAGKzHiIyMJ3Te/KWaJtrd8NLi4FCwdzt7avCYEqDfxlgDMQNIEXsKowxKMwv2tWmuLkStJkQFDl+Y5yxcfw5Ilk8KaBPjmXLH7DXNfN6VCg21h9G6ez0Rsjwz4bfKXcfMNpA56pi8Ch5DX7r/OcmYe8HAHxf995UQdpyoqf8gMTHnF+jSsguL7MZOtSgQXNHdG7VRj0jqyIfTWzYp29aPyzmcptjAQxeyHiXuOZkCAGTwJ0TkIxuHxH2fxZxUEq8xXAM8cLCgryvveDNNlzEeg141LuFPuvkB+FIaNPqS4VnCi7ZmtHZcid2La25CKJrHxz+JSb5XJha+ahj+mENA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(36756003)(6506007)(508600001)(186003)(110136005)(122000001)(316002)(38100700002)(83380400001)(54906003)(8676002)(91956017)(66476007)(8936002)(38070700005)(4326008)(82960400001)(2616005)(6486002)(71200400001)(86362001)(5660300002)(66556008)(66446008)(76116006)(64756008)(66946007)(6512007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnkzanZnMEg4MWViWEZaWThSbGptWGZBek1RM3NZdHhPZ2lEbmFvNXRuSjFx?=
 =?utf-8?B?VGZUTnJadUMwTDUyV3Y2eGJMS2dxbEx6TkxXL1BsRmE1RE5maERJQWFiSmVZ?=
 =?utf-8?B?OXlxQk8rbGZqSEJ4aVkxUjdLZ3NpZFgreitjNXd4UGtmemtjcFVrQnpTS0lC?=
 =?utf-8?B?MjhYQ2piNjhhbmVHeVl3VStLYkFZbUJvVDlDWWZOTFVpWlhLOUZuU1A0dEJ3?=
 =?utf-8?B?bXcreGJQOGVmWXNzOU9PWTUvUElJb3N1cmwvSTRBV2c0WE5ZZ1c2THdlbktN?=
 =?utf-8?B?S3M5Ni93Qzl3M2dFZXNzUFVSV1d4NW5LU3ZYTGx0cmJjRHMrNGFaNEh2dEdE?=
 =?utf-8?B?V1VxaVJWdUU0SCtuWkh6OFVVZXdnblZpRGRocTFQMyt2dmNHUTZQTk1aOVFN?=
 =?utf-8?B?UEZ0eVAycU5naEc2THgrVi81aXlZd0Jub3UvS0djamhHQTFTcmt2WE5sek1L?=
 =?utf-8?B?L05wbEQ3V0pjZlVYZUV3N0RPOTR1dGhpNVVzd1pKZjBydUQzV2h6d2tjN2hK?=
 =?utf-8?B?eGJUQ0p4c2RaM3cwMWpobm9abWFZZGxFYXBPRzJaNFJPYmhGZjN3SHVqUGJY?=
 =?utf-8?B?Z3QzcXhRVEJJUjh3d1JlNTEzWW5pd1hvVXJRWXdiUkxFcWd0eGlwTjJPRDFp?=
 =?utf-8?B?dGVVZkw0OFpGV3VXV2J0Q2lpeXVKdkkwN21xYW1RZ0tiVS9jS05FRWF5ZW1Y?=
 =?utf-8?B?M3ZFNXdVb1NieEdrL3hkNFdXK0VjSisrQ25oV1pGaVg1cGJHcEVhTENCTkJw?=
 =?utf-8?B?bXBlVjNPNG5PWTZCczhBZ3Y4UFl0YUxqWDl3LzcrS0l5QWphSGgzcW5hVk1w?=
 =?utf-8?B?NGtQR1lzWmsyUm52MTBPMzZmTGZlb2Jyc2Fmd0hldTNqVDU5U0Riek1nTk0z?=
 =?utf-8?B?MS91WUg5YTNIVmxzeFlRV3RhZVhNbm04ckR2cmhIbVROeFFCZDN1cEkrOTQ5?=
 =?utf-8?B?WCtuRWdBYXpPem1oVXRHZ25kcElxd3hLVUZXNEY0QWJrcm5wTWVuN2lRL0dN?=
 =?utf-8?B?WTl5V00zS3BtRlB6akg1N2J3MURqY09TSjhNaTdhYTZ4d3RGV2JkQnNkNlJQ?=
 =?utf-8?B?RzlwNXN6Q3hicFFqUU9ucXZBQytURE1sNXJjM0xqa2QzMnlnRW5LSFBNZmVM?=
 =?utf-8?B?UENDdU5nU2tZYko4Qi9Ub2pUcWczMmd1elZGczdSSWdxN3dGa1dsWld4OXUy?=
 =?utf-8?B?VnY0N0x2WGxpVUc2RmZXM3EvSmQzL1g1cDFUU3dELzFsSEpwSE9tV2kzN0dv?=
 =?utf-8?B?Z2pSQldmejZSelpsYi95MGQxdm1Ka0VpVDFxdGpkRkhkMkVwZXV1YkZsbHdz?=
 =?utf-8?B?V2ZGMG1FZDIrNkRkWlBKQUpjaEVIOCtYQ0o1dTcyVFhxWkkva2FjSkZ1MjZU?=
 =?utf-8?B?UWtrQW5tNkd5TnJiZWxrb1RCaTRISDl2VDVkVGRwc3F2WDYyMmVGZk5Fb2tO?=
 =?utf-8?B?d0VuSkpDT2R1SVR5MnlhMi9kQ0pLWUtRa3dYOG1QanNRMkJGbkhieVJlbmx4?=
 =?utf-8?B?UEh6YVJTbW9LR2dSTzh3WmQvSXp1N0grWjhnbXVLNThFZzlabW1QT1BpaVRX?=
 =?utf-8?B?L3VTb0NXTnpIVTlFamNvMzZMU0xZSncyK3ROSDRrcUZKSkhxNGF1b3J6RzVh?=
 =?utf-8?B?Zm1TY3RQUzBEclVZSVBBZzg3ZXM4RU1EcVh5OXBpQ0dLOEk3c0VUenlDVEZw?=
 =?utf-8?B?VzJjUVFpOXdCRHFnRUY4UTFCeURaNjJKQlJwNS8rMGFvWnVBRTJ6UFlsc0Nk?=
 =?utf-8?B?RFRkY0VuNmUrcmxEY2UxYmZPNWJaQU9PYUxoUm9EZnd3RVFER216R2FsN0Qw?=
 =?utf-8?B?VEk2SVMzdUN4alNXdDd5N01VcVZ3K1JWSFlteDFpSjFlYUd6WjI3cVRxVkpL?=
 =?utf-8?B?R0RLb2Z3azRSOFFibmpLZDNpL1hrVHVsWmRrd3lZQVZUdDVpaGFjV0J0K1dn?=
 =?utf-8?B?bWI1L2FRYTFmVStEcTVsdzYyNHhXOUV4cXduTHJlY25sNXdyK2tVZ0dTbkpW?=
 =?utf-8?B?K1BMMjNFTjBUYkdoTXczbHAyRFVzd0ltS3l6bzBtWXF3QWY4NVIxTDBpemNk?=
 =?utf-8?B?RzlBemZFRW9zMndlZkVSc0ZMYnRjNTN2UlIzd3RCMEc3WDEzTm1ZY0lIUzdD?=
 =?utf-8?B?TDhwYmpPUU0vS2RVdFY2anhpNEVkTzlBTXViZ0xsRzFJTGIreHN6dVI4YXRV?=
 =?utf-8?B?a0EweFFENTlTS3AwUVBnaFpITC8zcmxpOTE1cnNLMGQwaFpPSXBITmFNTmNw?=
 =?utf-8?Q?0RqfFRzRhbTwvCAMQpFzezdlyu/z6rR8WwFLVQLIM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5687A6123086F6428905A174471B95E8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b580789-472b-4903-3085-08d99f1e6ce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 23:05:27.2939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KuOtlMsVBwlMMFjU9goDmTJ+hpPgS7TRBfeAnz9R4MNYpc0K4O9ExVLjS3qM/Jcrv3K2bvgfxbVPbyDPU2LEolPaNN3jh42wqhURwCGvKb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1805
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

T24gV2VkLCAyMDIxLTExLTAzIGF0IDE0OjU0IC0wNzAwLCBqYWUuaHl1bi55b29AaW50ZWwuY29t
IHdyb3RlOgo+IEZyb206IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNv
bT4KPiAKPiBBZGQgYSBjaGVja2luZyBjb2RlIHdoZW4gaXQgZ2V0cyAtRVBST0JFX0RFRkVSIHdo
aWxlIGdldHRpbmcgYSBjbG9jawo+IHJlc291cmNlLiBJbiB0aGlzIGNhc2UsIGl0IGRvZXNuJ3Qg
bmVlZCB0byBwcmludCBvdXQgYW4gZXJyb3IgbWVzc2FnZQo+IGJlY2F1c2UgdGhlIHByb2Jpbmcg
d2lsbCBiZSByZS12aXNpdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8amFl
Lmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvc29jL2FzcGVlZC9h
c3BlZWQtbHBjLWN0cmwuYyB8IDYgKysrKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9hc3Bl
ZWQvYXNwZWVkLWxwYy1jdHJsLmMgYi9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLQo+IGxwYy1j
dHJsLmMKPiBpbmRleCA3Mjc3MWUwMThjNDIuLmUyMjYyZGJjN2NmNiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWxwYy1jdHJsLmMKPiArKysgYi9kcml2ZXJzL3NvYy9h
c3BlZWQvYXNwZWVkLWxwYy1jdHJsLmMKPiBAQCAtMzA3LDggKzMwNywxMCBAQCBzdGF0aWMgaW50
IGFzcGVlZF9scGNfY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4gKnBkZXYpCj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgbHBjX2N0cmwtPmNsayA9IGRldm1fY2xrX2dldChkZXYsIE5V
TEwpOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGxwY19jdHJsLT5jbGspKSB7Cj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldl9lcnIoZGV2LCAiY291bGRuJ3QgZ2V0IGNs
b2NrXG4iKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBUUl9FUlIo
bHBjX2N0cmwtPmNsayk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJjID0gUFRS
X0VSUihscGNfY3RybC0+Y2xrKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYg
KHJjICE9IC1FUFJPQkVfREVGRVIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkZXZfZXJyKGRldiwgImNvdWxkbid0IGdldCBjbG9ja1xuIik7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByYzsKPiDCoMKgwqDCoMKgwqDCoMKg
fQo+IMKgwqDCoMKgwqDCoMKgwqByYyA9IGNsa19wcmVwYXJlX2VuYWJsZShscGNfY3RybC0+Y2xr
KTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJjKSB7CgpUaGlzIHBhdHRlcm4gc2hvdWxkIGJlIGhh
bmRsZWQgdXNpbmcgZGV2X2Vycl9wcm9iZSgpCgpUaGFua3MKLUl3b25hCg==
