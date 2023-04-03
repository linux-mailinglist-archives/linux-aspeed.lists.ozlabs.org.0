Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C66836D55D3
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Apr 2023 03:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pr93X4zlhz3cF6
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Apr 2023 11:22:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WxPzqV0e;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=wendy.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WxPzqV0e;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqYk637Kyz3bnP
	for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Apr 2023 11:50:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680486606; x=1712022606;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=4wV0GPtHMsyegR3DjJoDJcDJp14zyPvknauEZaStmOg=;
  b=WxPzqV0ekTLuB+FyRfeZzW7q3QvJ/ydLFpVfnW4NlehpQ0uME5k9iUhb
   fwTtNXvIIIB/7BQvW3bJSG3+I9wK9whzNa+L0vPl54b3QXwcvT5uaxhtQ
   LUZoB+tyV8R2iv1P0HcpaxJX9KflW1CTwB8jbnYKyFVvoFHyY4KTG9v+K
   YFbEm9RD6c/eTuXcU4keL8faYkm4mY9I/pPSt9u0zXUUyNaksNcmovdW1
   /SVwxsSsODZ1gE7C6WsNANoiUGYBdSiB99OJalCfp25IMvoh2KCTC2S7v
   Gjc0LKvVl/kt5ooghPoLAfNqbDIa4T9e0czqm+ZqA2I+bRsF0XBw4Yujm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="321447289"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208,217";a="321447289"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 18:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="859995730"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208,217";a="859995730"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 02 Apr 2023 18:49:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 18:49:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 18:49:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 18:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNqmy74WX+iwPsUmjWEkLb6CYoK6D3Mk9E1taOc3tejnkfE5PmXW5Cy4kZZ56DlCX+P3L2+nz/VNuAyFVB4b44ohfu7O2VFbjqL0yIJzqS1+xC8OubId8gZ+XIjsfVS8eeqK7i1VKJQd5JlmfXyVcQIzHmRKqMBPZV6eb8dgcOhHMn6VTdEJLmKn6D4fV4f7PJWypxrgo5NJtw2c4WC127sQzGGqHD656s8XoPDiOXseV81RIKdXr1sFjE9A0FOXClmERwo2yUJhmItuz0sxOWNqWT89rgPHu+VbfUqCx7pl9KjF39VQlVemKy6uu/WO8DFUqI8NHy3+pFknisyTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue/CXtGM7Ht0f65S/6Vmi4kujkeUSpeYQkFGfykfoh4=;
 b=CDdlAvCpfVUCoC6fQAB1YcgR/nzgEEI0E1X/5XpjpqaNCQkjKhetBQbU03mWTJGNNpVmsEaxNnBfm1vaJ0gSKf8d1R4SOT1UxiHr0rYUL0c1c/4GFlAXwO+UW0+EriWKkOLfUi+oKWPqk8a26KHlIrU8EDGLTY9l45Xxx8ryYjfOYZrocPseQ+b9vCeaY6zp8AIfpnWwMvtZnHEUfwU6YZXDUBmkqU2PCEitPwSm0gDNVuB4dec23r4tPJSpIYDHHmy0Dv8xWlwWgfJ61AhByKoUZU52lV5tDgy1s0Mm565TDT+P6dfkrbU/0EOcgSAztwWDk76FaSexAl+r/b/Pgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3244.namprd11.prod.outlook.com (2603:10b6:5:8::22) by
 CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.30; Mon, 3 Apr 2023 01:49:54 +0000
Received: from DM6PR11MB3244.namprd11.prod.outlook.com
 ([fe80::6540:79c3:98e1:7be2]) by DM6PR11MB3244.namprd11.prod.outlook.com
 ([fe80::6540:79c3:98e1:7be2%4]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 01:49:54 +0000
From: "Wang, Wendy" <wendy.wang@intel.com>
To: "joel@jms.id.au" <joel@jms.id.au>
Subject: One ast driver reported in bugzilla 
Thread-Topic: One ast driver reported in bugzilla 
Thread-Index: AdllzgsQfgQn8wheSX6nArvPGtFL8g==
Date: Mon, 3 Apr 2023 01:49:54 +0000
Message-ID: <DM6PR11MB324495D75DFE7B53B7349C8F9F929@DM6PR11MB3244.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3244:EE_|CO1PR11MB5011:EE_
x-ms-office365-filtering-correlation-id: 1fd563bd-0240-40bb-56a1-08db33e5b899
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y7gDxDF5SxuFqF90cNbvjq7ZDQIyRGxqUSrkyhpROk4EScPPQNHuc2yY/Y1Q6FIUkRwT6n1B08Oi/+kiFLo0kC+GjirTEHQHKV4d6NR6EoLUROVR5kA5Ewox3SFVcFB15zEmm/zWgGfV9eHyUXiPc/W10HOBM4po0zmEGsSI5zfM9Je2bweZQ1k07p0d46jZS2KyjFL58i3cOjWssG2RSKq8Tn2dtN3XujClI24rxhzjkgqBO5IVEwwrDm0FHM1vCsiTI5px/8UJCkNHWXx1EOlQNt6pW1UnPdwx37UeuJtdterWBRJQ57gFg6j70h48F9bsP4isY2NIap4/YEBP/Ebh0499OPAXS2EQ0rJXwL+2mMVm8H/Tpfvvntqwa5SaxLzVf12RnDMI+WrLmc5wTRioku0LF8tjxraLe6oF6urGYAJb4pKs2Oza6Z+umWZzq82VwO14zXjvhar0Y5TfMhy39bozvRYP6Xph45WzsFYRWjpova38WQl7HPhN6wsssuTUlK8FuIgzeBfTc3QsKHL5qHTKCFmZbcYH+rVaX0Uk1yu8eOvXzkPbsWCgOGPdDdRcU5UW2vuo8tcq24QuyQRwldnmitL3dfNG7Xhpxs0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3244.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199021)(55016003)(6916009)(8676002)(66556008)(66476007)(76116006)(66446008)(64756008)(66946007)(478600001)(4326008)(316002)(52536014)(9326002)(8936002)(5660300002)(122000001)(82960400001)(41300700001)(38100700002)(4743002)(186003)(83380400001)(7696005)(966005)(71200400001)(6506007)(26005)(9686003)(86362001)(33656002)(2906002)(166002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?bHJ4dkU2aTNrSlV1WHpYN2NaNmxzYlY5a1FjYU0wN0dyeU1ySVpCUFp6?=
 =?iso-2022-jp?B?LzRFWTRiVk85RkgzQUZFUkE2WXR2amhubEhCNVJvdnVLN0U5dHQxR2hj?=
 =?iso-2022-jp?B?WmtPSStNL3dCM3A1Y3FvdVJ5dUd4c1BWbUVnWms1RHpycjFWVUJ5c0tT?=
 =?iso-2022-jp?B?a3lYdWtOd0JUelNQV2VYMlBBVUJGWlEzNHZQQlFlWkpUekZRRmY1WHNU?=
 =?iso-2022-jp?B?czY0T0RCamNvTjJDMUtDZ3g0MjVIWWRYYjNuRjVBOXlJV1dSaGU1OG9n?=
 =?iso-2022-jp?B?Q0JuVzdVQXZPcnZLK2NUTTUwTCt2Y3pDSGtYVjJpMnA2VzMxNUQ5OG5U?=
 =?iso-2022-jp?B?SjFORnhxSlk3THVyanFrNllRVGhPSENFaG10bElrM1dJQ1hZb004dkRC?=
 =?iso-2022-jp?B?U1ZDSC92V2pXbGJuSnFKMVFtYzE4dElhRFlyVVh2VUpmNjRvd0hvbldM?=
 =?iso-2022-jp?B?TTEwRmMzMmtkNTF6VUV6dytSTmM4TVZDbkk1ZlJuMVB0N3F5OW1oN3Ez?=
 =?iso-2022-jp?B?Z1BOMnBGSHlOM0NnMGl3YW4vdThjbkJrUTFDSk5YeWkvRElMN2R5RDFt?=
 =?iso-2022-jp?B?eW8wS1lkV1dRSUpwcm9hbmZUREwxNWZFOFBVRDgvV0tFNVc4bkxLZDhM?=
 =?iso-2022-jp?B?ejlsSjUxTGNyeGhjUHQxbTlvQmphU1VlYzhzWHkxZ1JFWHRqR25CTlRN?=
 =?iso-2022-jp?B?QmdRdmpSdDhyK2c5UmlDUU4xSU5jcnBoUG4yaHJXL0FBaHZKckVGZDkz?=
 =?iso-2022-jp?B?c3VoTElVazRmZ3hDSTRCNCtiRmxSUFBGQ29oSXhkV0JqRkJ2UDZLWEw3?=
 =?iso-2022-jp?B?ZE9aZFZORUltNnV0RHdQTnlzVXRYaXpNRE03RG92bE5WMU50YW1nOGZS?=
 =?iso-2022-jp?B?MUkyK3RVWGNKcGQ4WlhpMldNMXRKNW1ieUkzd09XbUlzb29GWGNkbGty?=
 =?iso-2022-jp?B?eisyUHRueVpjdWpVd3hKUmpsSzg1YnBjR3d1MXFPa0xhcTd6S1dKa2JS?=
 =?iso-2022-jp?B?eGhaU2dKSGtCRHNEZ0EyL1MvdzFwVEhGcVRvUzVEdmIxM0h4RkM0VlBm?=
 =?iso-2022-jp?B?WU5VdWc4bUtSdCs2bGNGMWJSWmZHaDBXUHZEK2Vqdk11RWFabDNOR3VK?=
 =?iso-2022-jp?B?VUIrcHh3SWMwSFJXTFhzR2JHQWUyV21LVzdwQjdtVnptcXcyaFR3MkFl?=
 =?iso-2022-jp?B?S0ErRnVrMVNzQ1B2cXVyL255a2ZYU2lXZ09wa0JPM0ZZR2NVdHBxNkEy?=
 =?iso-2022-jp?B?bmFuY3BSSUVHWjlJZlE4b0xXSHQzdjh3UUppQUMzMkxXZm00alN3b29P?=
 =?iso-2022-jp?B?SCtNb1g0a2FUQjh3R29Na20wWi9obHRwY2FiZStyOGtaNEpES3ZadkNO?=
 =?iso-2022-jp?B?V2t4cUJUUU5wa2l0OWl4MUN1dzlJWFU5U2VZMlhIT3d6K09HNmVFMDhQ?=
 =?iso-2022-jp?B?Z3lNdGlvQlNIMnF6OVpWbFd4VXd0QjEzUHEzTHFCUURtM3ErUUZ1REls?=
 =?iso-2022-jp?B?Zm1QZ2pIdWRMY1pPYkRKd3lTaUFSRWFRNWJlSk84TmwvZVkzOXFaamN4?=
 =?iso-2022-jp?B?V0x5SzJLZUsyVWtKejA4dnBteXJPME0wWmdkVWZ4eUpWOTB5WURVSjcr?=
 =?iso-2022-jp?B?aWNhRkhsYWRXeTdDclNKSmNaL20yVE00S245cjJSZDBKdURHTlFSYUVI?=
 =?iso-2022-jp?B?V2ZtM3ZLaEZrd1V2Q3N5NUEyRWt6azA4MHBVdmRnVkM0SzUrZVpTZk1w?=
 =?iso-2022-jp?B?c2Ezak5sMHNhR3NaMldZR3Z0MDNIYXMwWU11bUFWQnBDQWpnR2tMQjRt?=
 =?iso-2022-jp?B?d2dQZlBpbGFHNGt3c1k4KzF3aEpWaVc5aVpVTnUydDNTRDNvNEpxNkdD?=
 =?iso-2022-jp?B?MUVZUzBHU29pdml4KzNGa3BGOUQ1Z3UyTk5GcTZCK09RcGhMWFRpcUFz?=
 =?iso-2022-jp?B?dFRFSjdYSVBVdHRLdTNXYzVyUkQ5QmY1bHNTMW9vaG1hL0UrUXgyMUhk?=
 =?iso-2022-jp?B?Q3d1eC9yZGFlNGZKZVI3WURVN1RkazM4Q2NPNGVCUmltSlhjYmFUV0pV?=
 =?iso-2022-jp?B?WFZQNEtsRDlSdTN1dlJSNFNSQitQL2ZtMWtIOGlXMzhVUjVsSU05VjlB?=
 =?iso-2022-jp?B?UHhvVUdWaGswSUlEd1VOOHFXTVQ0eEROdWNKQWwwSWtWTXF6c2NRQkpk?=
 =?iso-2022-jp?B?aXFIM3c1U1RMbFo5UDJWNVU0WnlKeDVoRE9odmRScGVUbTBib1hQUUVS?=
 =?iso-2022-jp?B?bHMvOFo4c1cyaW9uTVRQeDBHdnd5WVY1MmlRR290K0ZMUm15OVBCQ0Rp?=
 =?iso-2022-jp?B?eXIzOA==?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB324495D75DFE7B53B7349C8F9F929DM6PR11MB3244namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3244.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd563bd-0240-40bb-56a1-08db33e5b899
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 01:49:54.0226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jo9QaRj04R0S9g7LMV5Heh7mhsbMczGYA25/r9eGR1vZWB0mzi25kENUkdXmFfAAgVcCxa4phMD1mGoqa2LvnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 04 Apr 2023 11:22:08 +1000
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_DM6PR11MB324495D75DFE7B53B7349C8F9F929DM6PR11MB3244namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Joel,

May I have your attention for one AST driver bug, which is detected on Inte=
l Emerald Rapids Server.
The bug is reported on Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?i=
d=3D217278

The issue can be reproduced on both mainline v6.1 and mainline v6.3-rc4

Here is the description:

ast driver will trigger unrecoverable kernel panic during S4 resuming.
If add "modprobe.blacklist=3Dast" kernel parameter to disable ast driver
Can avoid the kernel call trace.

[  456.012967] CPU251 is up
[  456.015985] smpboot: ++++++++++++++++++++=3D_---CPU UP  252
[  456.022183] smpboot: Booting Node 1 Processor 252 APIC 0xf9
[  456.028552] smpboot: Setting warm reset code and vector.
[  456.034650] smpboot: Asserting INIT
[  456.038648] smpboot: Waiting for send to finish...
[  456.044128] smpboot: Deasserting INIT
[  456.048334] smpboot: Waiting for send to finish...
[  456.053818] smpboot: #startup loops: 2
[  456.058131] smpboot: Sending STARTUP #1
[  456.062542] smpboot: After apic_write
[  456.066768] smpboot: Startup point 1
[  456.070898] smpboot: Waiting for send to finish...
[  456.076398] smpboot: Sending STARTUP #2
[  456.080832] smpboot: After apic_write
[  456.085082] smpboot: Startup point 1
[  456.089215] smpboot: Waiting for send to finish...
[  456.094718] smpboot: After Startup
[  456.124666] microcode: Load ucode for AP
[  456.129185] microcode: __load_ucode_intel: cp_data =3D 0x000000000000000=
0 cp_size =3D 0x0
000000000000 cp_size =3D 0x0ack at about 00000000937ed697
[  456.310542] smpboot: Stack at about 000000007168126e
[  456.316238] microcode: mc_cpu_starting: CPU253, err: 3
[  456.359827] CPU253 is up
[  456.362823] smpboot: ++++++++++++++++++++=3D_---CPU UP  254
[  456.369003] smpboot: Booting Node 1 Processor 254 APIC 0xfd
[  456.375378] smpboot: Setting warm reset code and vector.
[  456.381450] smpboot: Asserting INIT
[  456.385449] smpboot: Waiting for send to finish...
[  456.390924] smpboot: Deasserting INIT
[  456.395144] smpboot: Waiting for send to finish...
[  456.400590] smpboot: #startup loops: 2
[  456.404900] smpboot: Sending STARTUP #1
[  456.409299] smpboot: After apic_write
[  456.413555] smpboot: Startup point 1
[  456.417686] smpboot: Waiting for send to finish...
[  456.423193] smpboot: Sending STARTUP #2
[  456.427619] smpboot: After apic_write
[  456.431869] smpboot: Startup point 1
[  456.435993] smpboot: Waiting for send to finish...
[  456.441476] smpboot: After Startup
[  456.469575] microcode: Load ucode for AP
[  456.474101] microcode: __load_ucode_intel: cp_data =3D 0x000000000000000=
0 cp_size =3D 0x0
[  456.483382] smpboot: Stack [  457.507476] ttyS ttyS0: 1 input overrun(s)
[  457.509389] power_meter ACPI000D:00: Found ACPI power meter.
[  457.519717] serial 00:04: activated
[  457.524889] serial 00:05: activated
[  457.543671] nvme nvme0: 8/0/0 default/read/poll queues
[  457.840429] ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[  457.847500] ata6: SATA link down (SStatus 4 SControl 300)
[  457.853654] ata5: SATA link down (SStatus 4 SControl 300)
[  457.859819] ata1: SATA link down (SStatus 4 SControl 300)
[  457.865967] ata8: SATA link down (SStatus 4 SControl 300)
[  457.872129] ata4: SATA link down (SStatus 4 SControl 300)
[  457.878292] ata2: SATA link down (SStatus 4 SControl 300)
[  457.884470] ata3: SATA link down (SStatus 4 SControl 300)
[  457.890626] ata7.00: supports DRM functions and may not be fully accessi=
ble
[  457.900562] ata7.00: supports DRM functions and may not be fully accessi=
ble
[  457.909510] ata7.00: configured for UDMA/133
[  458.532192] virbr0: port 1(ens3) entered disabled state
[  461.085827] igb 0000:27:00.0 ens1: igb: ens1 NIC Link is Up 1000 Mbps Fu=
ll Duplex, Flow Control: RX
[  461.233851] igb 0000:a8:00.0 ens3: igb: ens3 NIC Link is Up 1000 Mbps Fu=
ll Duplex, Flow Control: RX
[  461.347436] virbr0: port 1(ens3) entered blocking state
[  461.353412] virbr0: port 1(ens3) entered forwarding state
[  461.377813] igc 0000:01:00.0 enp1s0: NIC Link is Up 1000 Mbps Full Duple=
x, Flow Control: RX/TX
[  469.667476] ast 0000:03:00.0: PM: **** DPM device timeout ****
[  469.674142] Call Trace:
[  469.676983]  <TASK>
[  469.679427]  __schedule+0x27a/0x6e0
[  469.683446]  ? _raw_spin_unlock_irqrestore+0x22/0x40
[  469.689117]  schedule+0x61/0xe0
[  469.692739]  schedule_timeout+0x7a/0xf0
[  469.697126]  ? __pfx_process_timeout+0x10/0x10
[  469.702216]  msleep+0x2d/0x40
[  469.705623]  ast_dp_launch+0x36/0xc0 [ast]
[  469.710328]  ast_post_gpu+0x1fa/0x240 [ast]
[  469.715096]  ast_pm_thaw+0x16/0x20 [ast]
[  469.719554]  pci_pm_thaw+0x44/0xa0
[  469.723450]  ? __pfx_pci_pm_thaw+0x10/0x10
[  469.728146]  dpm_run_callback+0x95/0x200
[  469.732653]  device_resume+0xea/0x210
[  469.736865]  ? __pfx_dpm_watchdog_handler+0x10/0x10
[  469.742413]  async_resume+0x1e/0x60
[  469.746401]  async_run_entry_fn+0x39/0x140
[  469.751098]  process_one_work+0x196/0x3c0
[  469.755691]  worker_thread+0x51/0x3a0
[  469.759902]  ? __pfx_worker_thread+0x10/0x10
[  469.764792]  kthread+0xea/0x120
[  469.768405]  ? __pfx_kthread+0x10/0x10
[  469.772695]  ret_from_fork+0x29/0x50
[  469.776793]  </TASK>
[  469.779346] Kernel panic - not syncing: ast 0000:03:00.0: unrecoverable =
failure
[  469.787630] CPU: 153 PID: 0 Comm: swapper/153 Tainted: G        W       =
    6.3.0-rc4-2023-03-28-intel-next-02154-g257279c18b21 #1
[  469.800891] Hardware name: Intel Corporation ArcherCity/ArcherCity, BIOS=
 EGSDCRB1.SYS.0100.D45.2303121331 03/12/2023
[  469.812782] Call Trace:
[  469.815614]  <IRQ>
[  469.817926]  dump_stack_lvl+0x36/0x50
[  469.822124]  panic+0x343/0x350
[  469.825665]  ? __pfx_dpm_watchdog_handler+0x10/0x10
[  469.831240]  ? __pfx_dpm_watchdog_handler+0x10/0x10
[  469.836775]  dpm_watchdog_handler+0x56/0x60
[  469.841571]  call_timer_fn+0x2b/0x140
[  469.845766]  __run_timers.part.0+0x1e7/0x280
[  469.850652]  ? tick_sched_timer+0x73/0x90
[  469.855257]  ? _raw_spin_lock_irq+0x18/0x30
[  469.860041]  ? __hrtimer_run_queues+0x13c/0x2d0
[  469.865220]  ? lapic_timer_shutdown.part.0+0x33/0x50
[  469.870897]  ? lapic_timer_shutdown+0x14/0x20
[  469.875882]  run_timer_softirq+0x35/0x70
[  469.880361]  __do_softirq+0x102/0x31d
[  469.884545]  irq_exit_rcu+0xc1/0x130
[  469.888663]  sysvec_apic_timer_interrupt+0xa2/0xd0
[  469.894150]  </IRQ>
[  469.896589]  <TASK>
[  469.899023]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[  469.904892] RIP: 0010:cpuidle_enter_state+0xd0/0x420
[  469.910547] Code: ff ff 8b 53 04 49 89 c5 8b 05 84 b5 ff 00 85 c0 0f 8f =
e3 02 00 00 31 ff e8 6d ab e7 fe 45 84 ff 0f 85 e3 01 00 00 fb 45 85 f6 <0f=
> 88 1e 01 00 00 48 8b 04 24 49 63 ce 48 6b d1 68 49 29 c5 48 89
[  469.931691] RSP: 0000:ff85092306c3fe88 EFLAGS: 00000206
[  469.937654] RAX: ff44661abdc40000 RBX: ffb7091ad765af00 RCX: 00000000000=
00000
[  469.945736] RDX: 0000000000000099 RSI: ffffffff99c06314 RDI: ffffffff99c=
0ac47
[  469.953814] RBP: 0000000000000003 R08: ffffffca120fb4c4 R09: 000000004b4=
b4b4b
[  469.961903] R10: 0000000000000010 R11: 00000000000025d6 R12: ffffffff9a2=
7c940
[  469.970007] R13: 0000006d5a5cd0ff R14: 0000000000000003 R15: 00000000000=
00000
[  469.978117]  ? cpuidle_enter_state+0xc3/0x420
[  469.983056]  cpuidle_enter+0x2d/0x40
[  469.987155]  cpuidle_idle_call+0x101/0x170
[  469.991825]  do_idle+0x74/0xc0
[  469.995336]  cpu_startup_entry+0x1d/0x20
[  469.999822]  start_secondary+0x12d/0x130
[  470.004310]  secondary_startup_64_no_verify+0xe0/0xeb
[  470.010063]  </TASK>
[  470.125520] Kernel Offset: 0x17000000 from 0xffffffff81000000 (relocatio=
n range: 0xffffffff80000000-0xffffffffbfffffff)
[  470.575721] ---[ end Kernel panic - not syncing: ast 0000:03:00.0: unrec=
overable failure ]---

[root@emr-2s7 ~]# lspci -vvv -s 03:00.0
03:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics =
Family (rev 52) (prog-if 00 [VGA controller])
        Subsystem: ASPEED Technology, Inc. ASPEED Graphics Family
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr+=
 Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 16
        NUMA node: 0
        IOMMU group: 72
        Region 0: Memory at 94000000 (32-bit, non-prefetchable) [size=3D16M=
]
        Region 1: Memory at 95000000 (32-bit, non-prefetchable) [size=3D256=
K]
        Region 2: I/O ports at 1000 [size=3D128]
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA PME(D0+,D1+,=
D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [50] MSI: Enable- Count=3D1/4 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel modules: ast

Thanks!


Best Regards
Wendy Wang
Tel=1B$B!'=1B(B(86) 21-6116 7440


--_000_DM6PR11MB324495D75DFE7B53B7349C8F9F929DM6PR11MB3244namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Joel,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">May I have your attention for one AST driver bug, wh=
ich is detected on Intel Emerald Rapids Server.<o:p></o:p></p>
<p class=3D"MsoNormal">The bug is reported on Bugzilla: <a href=3D"https://=
bugzilla.kernel.org/show_bug.cgi?id=3D217278">
https://bugzilla.kernel.org/show_bug.cgi?id=3D217278</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The issue can be reproduced on both mainline v6.1 an=
d mainline v6.3-rc4<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here is the description:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ast driver will trigger unrecoverable kernel panic d=
uring S4 resuming.<o:p></o:p></p>
<p class=3D"MsoNormal">If add &quot;modprobe.blacklist=3Dast&quot; kernel p=
arameter to disable ast driver<o:p></o:p></p>
<p class=3D"MsoNormal">Can avoid the kernel call trace.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.012967] CPU251 is up<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.015985] smpboot: ++++++++++++++++++++=3D=
_---CPU UP&nbsp; 252<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.022183] smpboot: Booting Node 1 Processo=
r 252 APIC 0xf9<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.028552] smpboot: Setting warm reset code=
 and vector.<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.034650] smpboot: Asserting INIT<o:p></o:=
p></p>
<p class=3D"MsoNormal">[&nbsp; 456.038648] smpboot: Waiting for send to fin=
ish...<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.044128] smpboot: Deasserting INIT<o:p></=
o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.048334] smpboot: Waiting for send to fin=
ish...<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.053818] smpboot: #startup loops: 2<o:p><=
/o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.058131] smpboot: Sending STARTUP #1<o:p>=
</o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.062542] smpboot: After apic_write<o:p></=
o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.066768] smpboot: Startup point 1<o:p></o=
:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.070898] smpboot: Waiting for send to fin=
ish...<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.076398] smpboot: Sending STARTUP #2<o:p>=
</o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.080832] smpboot: After apic_write<o:p></=
o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.085082] smpboot: Startup point 1<o:p></o=
:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.089215] smpboot: Waiting for send to fin=
ish...<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.094718] smpboot: After Startup<o:p></o:p=
></p>
<p class=3D"MsoNormal">[&nbsp; 456.124666] microcode: Load ucode for AP<o:p=
></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.129185] microcode: __load_ucode_intel: c=
p_data =3D 0x0000000000000000 cp_size =3D 0x0<o:p></o:p></p>
<p class=3D"MsoNormal">000000000000 cp_size =3D 0x0ack at about 00000000937=
ed697<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.310542] smpboot: Stack at about 00000000=
7168126e<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.316238] microcode: mc_cpu_starting: CPU2=
53, err: 3<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.359827] CPU253 is up<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.362823] smpboot: ++++++++++++++++++++=3D=
_---CPU UP&nbsp; 254<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.369003] smpboot: Booting Node 1 Processo=
r 254 APIC 0xfd<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.375378] smpboot: Setting warm reset code=
 and vector.<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.381450] smpboot: Asserting INIT<o:p></o:=
p></p>
<p class=3D"MsoNormal">[&nbsp; 456.385449] smpboot: Waiting for send to fin=
ish...<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.390924] smpboot: Deasserting INIT<o:p></=
o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.395144] smpboot: Waiting for send to fin=
ish...<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.400590] smpboot: #startup loops: 2<o:p><=
/o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.404900] smpboot: Sending STARTUP #1<o:p>=
</o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.409299] smpboot: After apic_write<o:p></=
o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.413555] smpboot: Startup point 1<o:p></o=
:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.417686] smpboot: Waiting for send to fin=
ish...<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.423193] smpboot: Sending STARTUP #2<o:p>=
</o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.427619] smpboot: After apic_write<o:p></=
o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.431869] smpboot: Startup point 1<o:p></o=
:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.435993] smpboot: Waiting for send to fin=
ish...<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.441476] smpboot: After Startup<o:p></o:p=
></p>
<p class=3D"MsoNormal">[&nbsp; 456.469575] microcode: Load ucode for AP<o:p=
></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.474101] microcode: __load_ucode_intel: c=
p_data =3D 0x0000000000000000 cp_size =3D 0x0<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 456.483382] smpboot: Stack [&nbsp; 457.50747=
6] ttyS ttyS0: 1 input overrun(s)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.509389] power_meter ACPI000D:00: Found A=
CPI power meter.<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.519717] serial 00:04: activated<o:p></o:=
p></p>
<p class=3D"MsoNormal">[&nbsp; 457.524889] serial 00:05: activated<o:p></o:=
p></p>
<p class=3D"MsoNormal">[&nbsp; 457.543671] nvme nvme0: 8/0/0 default/read/p=
oll queues<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.840429] ata7: SATA link up 6.0 Gbps (SSt=
atus 133 SControl 300)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.847500] ata6: SATA link down (SStatus 4 =
SControl 300)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.853654] ata5: SATA link down (SStatus 4 =
SControl 300)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.859819] ata1: SATA link down (SStatus 4 =
SControl 300)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.865967] ata8: SATA link down (SStatus 4 =
SControl 300)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.872129] ata4: SATA link down (SStatus 4 =
SControl 300)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.878292] ata2: SATA link down (SStatus 4 =
SControl 300)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.884470] ata3: SATA link down (SStatus 4 =
SControl 300)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.890626] ata7.00: supports DRM functions =
and may not be fully accessible<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.900562] ata7.00: supports DRM functions =
and may not be fully accessible<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 457.909510] ata7.00: configured for UDMA/133=
<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 458.532192] virbr0: port 1(ens3) entered dis=
abled state<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 461.085827] igb 0000:27:00.0 ens1: igb: ens1=
 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 461.233851] igb 0000:a8:00.0 ens3: igb: ens3=
 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 461.347436] virbr0: port 1(ens3) entered blo=
cking state<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 461.353412] virbr0: port 1(ens3) entered for=
warding state<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 461.377813] igc 0000:01:00.0 enp1s0: NIC Lin=
k is Up 1000 Mbps Full Duplex, Flow Control: RX/TX<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.667476] ast 0000:03:00.0: PM: **** DPM d=
evice timeout ****<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.674142] Call Trace:<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.676983]&nbsp; &lt;TASK&gt;<o:p></o:p></p=
>
<p class=3D"MsoNormal">[&nbsp; 469.679427]&nbsp; __schedule+0x27a/0x6e0<o:p=
></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.683446]&nbsp; ? _raw_spin_unlock_irqrest=
ore+0x22/0x40<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.689117]&nbsp; schedule+0x61/0xe0<o:p></o=
:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.692739]&nbsp; schedule_timeout+0x7a/0xf0=
<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.697126]&nbsp; ? __pfx_process_timeout+0x=
10/0x10<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.702216]&nbsp; msleep+0x2d/0x40<o:p></o:p=
></p>
<p class=3D"MsoNormal">[&nbsp; 469.705623]&nbsp; ast_dp_launch+0x36/0xc0 [a=
st]<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.710328]&nbsp; ast_post_gpu+0x1fa/0x240 [=
ast]<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.715096]&nbsp; ast_pm_thaw+0x16/0x20 [ast=
]<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.719554]&nbsp; pci_pm_thaw+0x44/0xa0<o:p>=
</o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.723450]&nbsp; ? __pfx_pci_pm_thaw+0x10/0=
x10<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.728146]&nbsp; dpm_run_callback+0x95/0x20=
0<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.732653]&nbsp; device_resume+0xea/0x210<o=
:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.736865]&nbsp; ? __pfx_dpm_watchdog_handl=
er+0x10/0x10<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.742413]&nbsp; async_resume+0x1e/0x60<o:p=
></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.746401]&nbsp; async_run_entry_fn+0x39/0x=
140<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.751098]&nbsp; process_one_work+0x196/0x3=
c0<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.755691]&nbsp; worker_thread+0x51/0x3a0<o=
:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.759902]&nbsp; ? __pfx_worker_thread+0x10=
/0x10<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.764792]&nbsp; kthread+0xea/0x120<o:p></o=
:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.768405]&nbsp; ? __pfx_kthread+0x10/0x10<=
o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.772695]&nbsp; ret_from_fork+0x29/0x50<o:=
p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.776793]&nbsp; &lt;/TASK&gt;<o:p></o:p></=
p>
<p class=3D"MsoNormal">[&nbsp; 469.779346] Kernel panic - not syncing: ast =
0000:03:00.0: unrecoverable failure<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.787630] CPU: 153 PID: 0 Comm: swapper/15=
3 Tainted: G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; W&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.3.0-rc4-2023-03-28-intel-next-0=
2154-g257279c18b21 #1<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.800891] Hardware name: Intel Corporation=
 ArcherCity/ArcherCity, BIOS EGSDCRB1.SYS.0100.D45.2303121331 03/12/2023<o:=
p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.812782] Call Trace:<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.815614]&nbsp; &lt;IRQ&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.817926]&nbsp; dump_stack_lvl+0x36/0x50<o=
:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.822124]&nbsp; panic+0x343/0x350<o:p></o:=
p></p>
<p class=3D"MsoNormal">[&nbsp; 469.825665]&nbsp; ? __pfx_dpm_watchdog_handl=
er+0x10/0x10<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.831240]&nbsp; ? __pfx_dpm_watchdog_handl=
er+0x10/0x10<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.836775]&nbsp; dpm_watchdog_handler+0x56/=
0x60<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.841571]&nbsp; call_timer_fn+0x2b/0x140<o=
:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.845766]&nbsp; __run_timers.part.0+0x1e7/=
0x280<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.850652]&nbsp; ? tick_sched_timer+0x73/0x=
90<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.855257]&nbsp; ? _raw_spin_lock_irq+0x18/=
0x30<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.860041]&nbsp; ? __hrtimer_run_queues+0x1=
3c/0x2d0<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.865220]&nbsp; ? lapic_timer_shutdown.par=
t.0+0x33/0x50<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.870897]&nbsp; ? lapic_timer_shutdown+0x1=
4/0x20<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.875882]&nbsp; run_timer_softirq+0x35/0x7=
0<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.880361]&nbsp; __do_softirq+0x102/0x31d<o=
:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.884545]&nbsp; irq_exit_rcu+0xc1/0x130<o:=
p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.888663]&nbsp; sysvec_apic_timer_interrup=
t+0xa2/0xd0<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.894150]&nbsp; &lt;/IRQ&gt;<o:p></o:p></p=
>
<p class=3D"MsoNormal">[&nbsp; 469.896589]&nbsp; &lt;TASK&gt;<o:p></o:p></p=
>
<p class=3D"MsoNormal">[&nbsp; 469.899023]&nbsp; asm_sysvec_apic_timer_inte=
rrupt+0x1a/0x20<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.904892] RIP: 0010:cpuidle_enter_state+0x=
d0/0x420<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.910547] Code: ff ff 8b 53 04 49 89 c5 8b=
 05 84 b5 ff 00 85 c0 0f 8f e3 02 00 00 31 ff e8 6d ab e7 fe 45 84 ff 0f 85=
 e3 01 00 00 fb 45 85 f6 &lt;0f&gt; 88 1e 01 00 00 48 8b 04 24 49 63 ce 48 =
6b d1 68 49 29 c5 48 89<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.931691] RSP: 0000:ff85092306c3fe88 EFLAG=
S: 00000206<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.937654] RAX: ff44661abdc40000 RBX: ffb70=
91ad765af00 RCX: 0000000000000000<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.945736] RDX: 0000000000000099 RSI: fffff=
fff99c06314 RDI: ffffffff99c0ac47<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.953814] RBP: 0000000000000003 R08: fffff=
fca120fb4c4 R09: 000000004b4b4b4b<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.961903] R10: 0000000000000010 R11: 00000=
000000025d6 R12: ffffffff9a27c940<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.970007] R13: 0000006d5a5cd0ff R14: 00000=
00000000003 R15: 0000000000000000<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.978117]&nbsp; ? cpuidle_enter_state+0xc3=
/0x420<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.983056]&nbsp; cpuidle_enter+0x2d/0x40<o:=
p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.987155]&nbsp; cpuidle_idle_call+0x101/0x=
170<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.991825]&nbsp; do_idle+0x74/0xc0<o:p></o:=
p></p>
<p class=3D"MsoNormal">[&nbsp; 469.995336]&nbsp; cpu_startup_entry+0x1d/0x2=
0<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 469.999822]&nbsp; start_secondary+0x12d/0x13=
0<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 470.004310]&nbsp; secondary_startup_64_no_ve=
rify+0xe0/0xeb<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 470.010063]&nbsp; &lt;/TASK&gt;<o:p></o:p></=
p>
<p class=3D"MsoNormal">[&nbsp; 470.125520] Kernel Offset: 0x17000000 from 0=
xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)=
<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 470.575721] ---[ end Kernel panic - not sync=
ing: ast 0000:03:00.0: unrecoverable failure ]---<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[root@emr-2s7 ~]# lspci -vvv -s 03:00.0<o:p></o:p></=
p>
<p class=3D"MsoNormal">03:00.0 VGA compatible controller: ASPEED Technology=
, Inc. ASPEED Graphics Family (rev 52) (prog-if 00 [VGA controller])<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subsystem=
: ASPEED Technology, Inc. ASPEED Graphics Family<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Control: =
I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ =
FastB2B- DisINTx-<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status: C=
ap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &l=
t;MAbort- &gt;SERR- &lt;PERR- INTx-<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Interrupt=
: pin A routed to IRQ 16<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NUMA node=
: 0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IOMMU gro=
up: 72<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Region 0:=
 Memory at 94000000 (32-bit, non-prefetchable) [size=3D16M]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Region 1:=
 Memory at 95000000 (32-bit, non-prefetchable) [size=3D256K]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Region 2:=
 I/O ports at 1000 [size=3D128]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Capabilit=
ies: [40] Power Management version 3<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags: PMEClk- DSI- D1+ D2+ AuxCurre=
nt=3D375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status: D0 NoSoftRst- PME-Enable- DS=
el=3D0 DScale=3D0 PME-<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Capabilit=
ies: [50] MSI: Enable- Count=3D1/4 Maskable- 64bit+<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Address: 0000000000000000&nbsp; Data=
: 0000<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kernel mo=
dules: ast<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Wendy Wang<o:p></o:p></p>
<p class=3D"MsoNormal">Tel<span lang=3D"ZH-CN" style=3D"font-family:SimSun"=
>=1B$B!'=1B(B</span>(86) 21-6116 7440<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB324495D75DFE7B53B7349C8F9F929DM6PR11MB3244namp_--
