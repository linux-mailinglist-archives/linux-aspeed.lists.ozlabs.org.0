Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D6957A12
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL66KQgz7BQW
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=VTpZ/ow9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::702; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20702.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkvPP1ZFDz2yXs
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 15:51:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioKpuX8M9UXnKgYaPk8AmOknFt+fCOBuDgw9aQaLFNV5jPEF81F7aLegCUGcKmjLG/g4VVIiEwkE97Hmf1CwaW+B2zSJtWloQ0FacD6mbzWNAqnJDRqmc1pAzVib+ZcrD1xtn53oIyZtDLMPxfs7po5/sQGaVuiSpqKKgQFSJ0mFsWJOvwcThMWCT3Fsn9Iq3OzPZ6eQ2kamq1dh3SeID5M5VOwYHHMLm5WT+xT3ybLdK4pEeTV5gqe5GSPbQhfgTWdVOPEujfekqMN/bsY6r/aYg/Etd3KelrF4+KP1rchtm96EIJQ06FBPOzpJa5u0652jWJ9OirmcN0pEuejvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgwYDLchgX8aCmA6+5cU3KxlOzhUIMUzZmHSorKYGjM=;
 b=bv4sCyoUV4XJwmLc/r/bQkUTJXJ3fyxLbYfZ8wRHtVQZIU46WBduOv/eRwZ6AvR9cbbUSwVaRL0QgH8U10b3ke0bbJ3zGOFjT13EUT2xG8NmRsttHRA4e35q+XWo1nOk3tkr249SiGuftAnwZX9RByNMXoIKTjzUruOCJz+B98VW1VBAKTtLT38/6lXjTQzDEWNSxAyXxBc902Q+iD1oVOb7Bn+ADJQOZI08ZPTFh0OsZ6vb3yfRrQ44d42RLM/8X4d0ojp9saZwdwbSHFCwqNwCqEJBR4Enu0faItPjjtWOyJ36JIYn/9O5tO/mWwKBk3nFZQrXAV0tNQhncNnUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgwYDLchgX8aCmA6+5cU3KxlOzhUIMUzZmHSorKYGjM=;
 b=VTpZ/ow97SJ6EpEjCqp+1dVtQnx16d8LLZ7CxA3dvhvCic+WOUiAynGYc95iMZRorQn6PCrWPX3cw4a1C5BJufI02CWwHPI5fDSwLnwV0a0NxwNfjtF/TSvCgx48wreL2SLshevCcLXL/J4S7xve/4vj76d86jBve0TRCEZBoAM+83PK9QXx6T1FeoNrowZV6JvO/Jjo9lfWsvNPQi5WF37TJMa4C+DMlq75LZZNdRT5yQUntvMVLmUL7TiTi3X4mWDsqlXAhJXMciuiUrHOATadO6RhRjfJyCC9BU2QtJ9m2dc3SAC1Bc25qvyod5Tq+CzZqluryPZSczjLuiYbcA==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7000.apcprd06.prod.outlook.com (2603:1096:101:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 05:50:50 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 05:50:50 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDAwLzEwXSBJbnRyb2R1Y2UgQVNQRUVEIEFTVDI3WFgg?=
 =?big5?Q?BMC_SoC?=
Thread-Topic: [PATCH v1 00/10] Introduce ASPEED AST27XX BMC SoC
Thread-Index: AQHa30uF0np0rPVCvEWxq1tD4p2I8LII+5GAgAAGyICAHtD9Rg==
Date: Thu, 15 Aug 2024 05:50:50 +0000
Message-ID:  <PSAPR06MB4949A360F5C5EFDF87DF741489802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <172199921352.1507193.4411331020670815695.robh@kernel.org>
 <241ceb9b-b29f-41fd-8987-2feba2e5e08e@kernel.org>
In-Reply-To: <241ceb9b-b29f-41fd-8987-2feba2e5e08e@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7000:EE_
x-ms-office365-filtering-correlation-id: 52f60827-45e2-4b2f-7a75-08dcbcee37ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?cUhOQ2hna3dvZ0RpdGpoN1pVRm5IR0lEYXV2eVdyMERCNHVQMXJCWmduai8xcGd3?=
 =?big5?B?WHYzaTg4Z0dYN25ZTFlKQnBhSHA1aWlMZ25JQnc5bStyb0k5VEtWMDNtMHhrY3lB?=
 =?big5?B?cEthR2ZhNDNKVzV1WnJjMHN0eFFBamc4cUVQcGVnRVlHNkY1S3RjTEVSeHBGM29W?=
 =?big5?B?SGJ4bmgvU1RQWlJlUHhoalRIbHNhSFF2a2JrbnZVNDlsR2dMYm9MdllvY3NzeE1B?=
 =?big5?B?NWtFbVcwMm52eER3dXU1Zk1rT0dZZUFwNFgwejdValk5dWwzYTBZNVhRcmJhZWRO?=
 =?big5?B?NE0wUUtXQ0tLVStQMjV3NjRYRDRCMG5PZzV4cWdBZ1dNbjJrOXhjZEszNmRiM1h3?=
 =?big5?B?bDBDUEJZZ0FLd0gvT1dITWpRNUNmUjNxWVZyU3JBOHdhT1pibkZwai9Ldmk0RlZi?=
 =?big5?B?cWd6dEdXUzRCcXJrRlZzTjg5VXVXcEFrQkdJaHpnOVhqbjIyUzB2R1llbjVvV01k?=
 =?big5?B?UWZQOUdqZGdQN3Zjck9IU1docWZlanlaMVArN0l1WjZvQ040bzZwRXJ2eDBmYlFl?=
 =?big5?B?YTlhaVJVV3ZGdFYxNjRpUUQ0eXJtdzBCM1VNaVA3UzdpRFV1dERkRzRWL1hFMm8v?=
 =?big5?B?MEFPV1VUQnNSNy9hRHFHODVTVTlwamtqUmg0ZFpyQk5yMnpia3lLZkUySWxaakd0?=
 =?big5?B?aTgwYXpUZjZwVEhnTjZCblc1UVN1S1gvczZqWlMvU3JRU1hiamdsbW0yZDhSUERz?=
 =?big5?B?L0x1OWhYL2RyUkxua0l3WmpSYW11Y2hsVTVvZXoyWXo1ZS9iOGNkYjc3cGYvbEZB?=
 =?big5?B?NHdIL3pFQU9laTVyNXUvc2E3S1BOSDVkdzRjdGs0MVhweTRHMUwzUzVKeFczWm9Y?=
 =?big5?B?ZHk1bkRSc3ArNDNQbWpLQkozeTUzNnBpYlBGU2pzdzE2VHFFL0R3SCszMzRXOTBU?=
 =?big5?B?ZzZoaFI2NWs5c1hKNXdQSTVRSWkxTVpjeFhxYmUxYTNGQVJNb1o3cWdUMEtyRTBk?=
 =?big5?B?M2pTWnZEc1kzNVlSZUtCeHoxWE1hUWJpam1RSmdUVW9Jaitnd2Nsa0JXcG1QWWRK?=
 =?big5?B?TG90RGxHek5jamI3amowNmFGMW1tUUFOUHpPSVA4Z2F0cERicUZvOHRDcTF4bUhC?=
 =?big5?B?c2dxUW03aTc2Wm5zblJqRXNTNmtTb016YU9vT1MzK2FCUERld3VwNFZVSUlLTTFx?=
 =?big5?B?aHFJNEtML0k1enlOcnhHeGhLVk05aUEzaXF5MENwZUZkcXJONlVXTVRGNHBETzRG?=
 =?big5?B?OXcvdEFUS3RyWUlqRHl5TGNSUmYwVnVidHl0Z2xTWVNIUEJ6cVUzRGlHR0hWbVFM?=
 =?big5?B?Y2tDQzNhSXE3SEVIcy9xZW4wNTdoMWYzb1A3c1A2YzBVenB4Y0FsWDNOaFM5U1dO?=
 =?big5?B?Nkh5cnZPdW4yeXBIWEREcjc0M3BtcFdKdjl6STZMRVoxbS8yOTQ0QmExNEFJYndY?=
 =?big5?B?eW90cTB4RnJhSmxpVzdNZVFxbERiKytMZGdiS0x4YmdhUlpsZDhzVEpsYjRQb1FS?=
 =?big5?B?REU1ZnQ1aE9wOWNFcFczdzk5NVRyQVM2Rk9uQnFCQm5xMXE1S3ErbStWYUZVTGdh?=
 =?big5?B?VWlwUlpKRU05bzI3d1NKUXhyMFVDZGNkQUdzL0ozVjRCUkxSM3Q5a1NTSDlBUllv?=
 =?big5?B?N0ZGWnRTNmpwc1g4S1RhMFJ3Smt2VHB2c3ZzUkk3V1gzc3NTT05pbzUybUNDR2lt?=
 =?big5?B?cWFRY0hXNDJGMW1FTU5iQ2FYc2NUL1pzQUViTkRoL0FJaUJ5ZzhYUVBvaFFseUhi?=
 =?big5?B?MUF6K1dpYXZHeWNSYUVoVVFtendkakF4b3pXMmZIaDV1Y1UxaTliVHl1N0FHUG1j?=
 =?big5?B?Sm1xYThMTGVUQWZRL3lvQkg1RTc5UzdGZFlzYnd6dnZyOFRwc1E9PQ==?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?eS9pTXAvQ2k4bjhOSkZXbFhLMThMNEEvU1JLTk9nbUNZZGtxVXRNVW4yRGdZZVV3?=
 =?big5?B?c2xGSTE3R05oc1dEbzFlMnBKU29OQ1NSRmxXaFl2L1FseHl5OWlMWFArVENpb0xk?=
 =?big5?B?aHNVeEhpbm9lclZzalRydkIxU0pJR0d2enUxN1ZOTXZWSnplL2lQOXJUUWJFWFhh?=
 =?big5?B?cnNSVnZIRzRzQ2M4c21VYUc5UDNTZXBLRnozMkpwQVB0NUtNU2JoZFNwOVFGLzFk?=
 =?big5?B?emJPaVcya2lYQkZid0FqWDlDSXNjRmZ0b0c2Qk1pcUZhTVd0Yk5PaHRpNmRCSWww?=
 =?big5?B?blVDdWEvRnVqYmd4Yk1FTmx1cWY4eU5aallLUC91N0RWU3NmR3ZaUTdsZTJjZVc1?=
 =?big5?B?ZEFxd1lMMDBGbENpZWZ5VVJsdjJnR2l0MThvUnRTTkZnZi9FdDNWMTVKc0ZtU0NE?=
 =?big5?B?aDlGenR1NnMrcHFKYkVka1YwYkhOMG9QbkYrYXpZaW9qN0hiS2IwNTcwS21CdmM3?=
 =?big5?B?VHdrcE90TzBwYk43aVRNTFBpNUxnaVU2QlU0WGFHV2Z6V2JLd0doQlo0czNGL1dv?=
 =?big5?B?OEJiZFVVOThQVXRFbFdkdnkybEhqSEZML1FXL3RMd1F2ek9jQ08xYTA3MUYzdDhR?=
 =?big5?B?ODNqWERxMzJreGFiL1J1a0NXa1lDc2s1WVlIRllxbzZRZ2tsdW5WeEl6NHFRRkUz?=
 =?big5?B?NnFad3dWUkN4akpSUUprczJlTE94c1pyWkpNa21laFZ2a01yQXIvbjY5Q3VZZ1lT?=
 =?big5?B?YWxTVk84QzJHdFRiR281R3hvZUp0UlhGTVhUYW1iUXNUZDVLcGdkZGwycm8yODU3?=
 =?big5?B?MllaSzJTUWhjQ25NN2RBanBKSmhkSGlPSFYzRC9mTzl1YXJydCtuL29pZjdKV1dN?=
 =?big5?B?d1pDbFRJSmxveitMQXNydlJNOVBzU1NNNzZ2YjczRzNxS3NpcWtCZU05c29TQkdV?=
 =?big5?B?S0RpeVcxTFVYaFVnQlZmVWFOK0dPbVJVNjhoV0FScklSMmcrdUZVUmNIaTZBQmhz?=
 =?big5?B?aWZxRFdBTzJNbjgxK0pIMXA5UklHZXAxUTZIV1NzZjdxbkRXYjlHY0I4aklQVUR3?=
 =?big5?B?S2xiVFNUbmpFZ0FIWTVCck16WlhFY1VUaUNxYWo4ZklXK3hrcHE0QzBJQUFudjc5?=
 =?big5?B?eWF1OFpZY3ZzV08ya3FIOUp3QldZQVFHbEdEZUtaNHN6djZITVFabkxtanYwZmRp?=
 =?big5?B?OVhnZlBWRGNOQndVeFY3RWRNS3B3RkRjR3BnTzRueXFxOTdiejZxN3lHUjkvZFVu?=
 =?big5?B?TW1vQUh0cDA4ZzBQdTdVYUtrdHdhRW04WXJTcTcyWGRkL2J3QlRVRnV0N256Qy9p?=
 =?big5?B?YXFVN0FMalRpZ0wxUW10WFRZTGdsRW9WV05Lc2diSnVjS2tQT2g5T25BK0hOT3Ns?=
 =?big5?B?cFROZ1VKbDlkNkRkZktha3AvZ3BSNGVOOXZKSzRDSW9wUjZFc0ZoTlNWd1N6N0hy?=
 =?big5?B?R3JlVm96V3hZNm1qSzhocjQ3QTBBZWNXbHBkZWx1VUZGUHNBY0RUVHhjZFR1ancz?=
 =?big5?B?eDUyMzF0bTlJMlpVSit4cDhVNEROK0l4U29iZEFEb2VTb3lJNm1mRHpvbUJRT3kz?=
 =?big5?B?dE9EaG1pTFMvWmlJZ3lOTW1oRmJVTGhEb1llL3FoQVYyU1l5V0J6eUxJTFV4TXVl?=
 =?big5?B?VWRRSWgyOGxIeFVuQ0g5MUc5QXZab2ZmQ3Y0QlNLUVFwVWh4SUpkeWJGTGQ3SEor?=
 =?big5?B?dkZjMXRpakp0b3FoS3FVZUlXSnFwc0dzTlRPRnY1dlI4QVkwQnJiM0ZlVkkvQXQ5?=
 =?big5?B?MHhIMEcrYXo1MG8weHRpWjkzZDZxdGY2dVQ5eEdzWldXREVya0hzK3MrVzBib0tS?=
 =?big5?B?Wjd6dXZzVEl2ckFnN3NRMmhja21DUzJLR3BIZ0wvRGR4RWtWT3BZYy9IZThVMHQx?=
 =?big5?B?em9sejJuR1k5RkJoNGtJcmJUMnpjUitkUkRIMkFrL3Zoa0VjZSt2VkRsaTF5TDV2?=
 =?big5?B?aFNUQzg2aUVwSkZjUW02OVJGamNFTWF6UDVjVUdrQkFPMHk0eTNHc0hGVzY2ZVZw?=
 =?big5?B?YjdNNTVJeDNIeldWb1BJSXNWcElvUk5CWS8zSTlYdXNXbnZndlB4TGhLc0NRZ1VY?=
 =?big5?Q?atTphZVyr5qNLFUk?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB4949A360F5C5EFDF87DF741489802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f60827-45e2-4b2f-7a75-08dcbcee37ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 05:50:50.1838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbEFojwyGaERMtC4T/jhnVCBTKWbhPys/Rr2hjWuJNj/LXqJnR0BXMDUta66DRV4NMOcaoovndo4FT1892Ge35KEhXGAt2fMh0qAweSBa0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7000
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "will@kernel.org" <will@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "Rob Herring \(Arm\)" <robh@kernel.org>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, "arnd@arndb.de" <arnd@arndb.de>, "u-kumar1@ti.com" <u-kumar1@ti.com>, "lee@kernel.org" <lee@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "nfraprado@collabora.com" <nfraprado@collabora.com>, BMC-SW <BMC-SW@aspeedtech.com>, "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "soc@kernel.org" <soc@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "olof@lixom.net" <olof@lixom.net>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_PSAPR06MB4949A360F5C5EFDF87DF741489802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KSSB3aWxsIHNwZXBlcmF0ZSBjbG9jayBwYXJ0IGluIHRoZSB2MyBwYXRjaCBp
bnRvIFJ5YW4ncyBjbG9jayBzZXJpZXMuDQoNCj4+DQo+PiBPbiBGcmksIDI2IEp1bCAyMDI0IDE5
OjAzOjQ1ICswODAwLCBLZXZpbiBDaGVuIHdyb3RlOg0KPj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyBp
bml0aWFsIHN1cHBvcnQgZm9yIHRoZSBBU1BFRUQuDQo+Pj4gQVNUMjdYWCBCb2FyZCBNYW5hZ2Vt
ZW50IGNvbnRyb2xsZXIgKEJNQykgU29DIGZhbWlseS4NCj4+Pg0KPj4+IEFTVDI3MDAgaXMgQVNQ
RUVEJ3MgOHRoLWdlbmVyYXRpb24gc2VydmVyIG1hbmFnZW1lbnQgcHJvY2Vzc29yLg0KPj4+IEZl
YXR1cmluZyBhIHF1YWQtY29yZSBBUk0gQ29ydGV4IEEzNSA2NC1iaXQgcHJvY2Vzc29yIGFuZCB0
d28NCj4+PiBpbmRlcGVuZGVudCBBUk0gQ29ydGV4IE00IHByb2Nlc3NvcnMNCj4+Pg0KPj4+IFRo
aXMgcGF0Y2hzZXQgYWRkcyBtaW5pbWFsIGFyY2hpdGVjdHVyZSBhbmQgZHJpdmVycyBzdWNoIGFz
Og0KPj4+IENsb2Nrc291cmNlLCBDbG9jayBhbmQgUmVzZXQNCj4+Pg0KPj4+IFRoaXMgcGF0Y2hz
ZXQgd2FzIHRlc3RlZCBvbiB0aGUgQVNQRUVEIEFTVDI3MDAgZXZhbHVhdGlvbiBib2FyZC4NCj4+
Pg0KPj4+IEtldmluIENoZW4gKDEwKToNCj4+PiAgIGR0LWJpbmRpbmc6IG1mZDogYXNwZWVkLGFz
dDJ4MDAtc2N1OiBBZGQgYmluZGluZyBmb3IgQVNQRUVEIEFTVDI3MDANCj4+PiAgICAgU0NVDQo+
Pj4gICBkdC1iaW5kaW5nOiBjbGs6IGFzdDI3MDA6IEFkZCBiaW5kaW5nIGZvciBBc3BlZWQgQVNU
Mjd4eCBDbG9jaw0KPj4+ICAgY2xrOiBhc3QyNzAwOiBhZGQgY2xvY2sgY29udHJvbGxlcg0KPj4+
ICAgZHQtYmluZGluZ3M6IHJlc2V0OiBhc3QyNzAwOiBBZGQgYmluZGluZyBmb3IgQVNQRUVEIEFT
VDI3MDAgUmVzZXQNCj4+PiAgIGR0LWJpbmRpbmdzOiBhcm06IGFzcGVlZDogQWRkIG1haW50YWlu
ZXINCj4+PiAgIGR0LWJpbmRpbmdzOiBhcm06IGFzcGVlZDogQWRkIGFzcGVlZCxhc3QyNzAwLWV2
YiBjb21wYXRpYmxlIHN0cmluZw0KPj4+ICAgYXJtNjQ6IGFzcGVlZDogQWRkIHN1cHBvcnQgZm9y
IEFTUEVFRCBBU1QyNzAwIEJNQyBTb0MNCj4+PiAgIGFybTY0OiBkdHM6IGFzcGVlZDogQWRkIGlu
aXRpYWwgQVNUMjdYWCBkZXZpY2UgdHJlZQ0KPj4+ICAgYXJtNjQ6IGR0czogYXNwZWVkOiBBZGQg
aW5pdGlhbCBBU1QyNzAwIEVWQiBkZXZpY2UgdHJlZQ0KPj4+ICAgYXJtNjQ6IGRlZmNvbmZpZzog
QWRkIEFTUEVFRCBBU1QyNzAwIGZhbWlseSBzdXBwb3J0DQo+Pj4NCj4+PiAgLi4uL2JpbmRpbmdz
L2FybS9hc3BlZWQvYXNwZWVkLnlhbWwgICAgICAgICAgIHwgICAgNiArDQo+Pj4gIC4uLi9iaW5k
aW5ncy9tZmQvYXNwZWVkLGFzdDJ4MDAtc2N1LnlhbWwgICAgICB8ICAgIDMgKw0KPj4+ICBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzICsNCj4+PiAg
YXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyAgICAgICAgICAgICAgICAgIHwgICAxNCArDQo+
Pj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgIDEg
Kw0KPj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9NYWtlZmlsZSAgICAgICAgICAgfCAg
ICA0ICsNCj4+PiAgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc3LmR0c2kgICAg
IHwgIDIxNyArKysNCj4+PiAgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvYXN0MjcwMC1ldmIu
ZHRzICAgIHwgICA1MCArDQo+Pj4gIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAg
ICAgICAgICAgICB8ICAgIDEgKw0KPj4+ICBkcml2ZXJzL2Nsay9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAxICsNCj4+PiAgZHJpdmVycy9jbGsvY2xrLWFzdDI3MDAuYyAg
ICAgICAgICAgICAgICAgICAgIHwgMTE2NiArKysrKysrKysrKysrKysrKw0KPj4+ICAuLi4vZHQt
YmluZGluZ3MvY2xvY2svYXNwZWVkLGFzdDI3MDAtY2xrLmggICAgfCAgMTgwICsrKw0KPj4+ICAu
Li4vZHQtYmluZGluZ3MvcmVzZXQvYXNwZWVkLGFzdDI3MDAtcmVzZXQuaCAgfCAgMTI2ICsrDQo+
Pj4gIDEzIGZpbGVzIGNoYW5nZWQsIDE3NzIgaW5zZXJ0aW9ucygrKQ0KPj4+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvTWFrZWZpbGUNCj4+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1nNy5kdHNpDQo+
Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9hc3QyNzAw
LWV2Yi5kdHMNCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL2Nsay1hc3QyNzAw
LmMNCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNw
ZWVkLGFzdDI3MDAtY2xrLmgNCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmlu
ZGluZ3MvcmVzZXQvYXNwZWVkLGFzdDI3MDAtcmVzZXQuaA0KPj4+DQo+Pj4gLS0NCj4+PiAyLjM0
LjENCj4+Pg0KPj4+DQo+Pj4NCj4+DQo+Pg0KPj4gTXkgYm90IGZvdW5kIG5ldyBEVEIgd2Fybmlu
Z3Mgb24gdGhlIC5kdHMgZmlsZXMgYWRkZWQgb3IgY2hhbmdlZCBpbiB0aGlzDQo+PiBzZXJpZXMu
DQo+Pg0KPj4gU29tZSB3YXJuaW5ncyBtYXkgYmUgZnJvbSBhbiBleGlzdGluZyBTb0MgLmR0c2ku
IE9yIHBlcmhhcHMgdGhlIHdhcm5pbmdzDQo+PiBhcmUgZml4ZWQgYnkgYW5vdGhlciBzZXJpZXMu
IFVsdGltYXRlbHksIGl0IGlzIHVwIHRvIHRoZSBwbGF0Zm9ybQ0KPj4gbWFpbnRhaW5lciB3aGV0
aGVyIHRoZXNlIHdhcm5pbmdzIGFyZSBhY2NlcHRhYmxlIG9yIG5vdC4gTm8gbmVlZCB0byByZXBs
eQ0KPj4gdW5sZXNzIHRoZSBwbGF0Zm9ybSBtYWludGFpbmVyIGhhcyBjb21tZW50cy4NCj4+DQo+
PiBJZiB5b3UgYWxyZWFkeSByYW4gRFQgY2hlY2tzIGFuZCBkaWRuJ3Qgc2VlIHRoZXNlIGVycm9y
KHMpLCB0aGVuDQo+PiBtYWtlIHN1cmUgZHQtc2NoZW1hIGlzIHVwIHRvIGRhdGU6DQo+Pg0KPj4g
ICBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+Pg0KPj4NCj4+IE5ldyB3YXJuaW5n
cyBydW5uaW5nICdtYWtlIENIRUNLX0RUQlM9eSBhc3BlZWQvYXN0MjcwMC1ldmIuZHRiJyBmb3Ig
MjAyNDA3MjYxMTAzNTUuMjE4MTU2My0xLWtldmluX2NoZW5AYXNwZWVkdGVjaC5jb206DQo+DQo+
S2V2aW4sDQo+SnVzdCB0byBjbGFyaWZ5LiBMb29raW5nIGF0IHRoZSBwYXRjaGVzIGl0IHdhcyBx
dWl0ZSBvYnZpb3VzIHlvdSBkaWQgbm90DQo+dGVzdCBpdCB3aXRoIGR0YnNfY2hlY2suIEZvciBh
IG5ldyBhcm02NCBwbGF0Zm9ybSB3aXRob3V0IGFueSBsZWdhY3ksDQo+aGF2aW5nIDAgd2Fybmlu
Z3MgaXMgYSBtdXN0Lg0KQWdyZWUuDQo+DQo+Q29uc2lkZXIgRG9jdW1lbnRhdGlvbi9wcm9jZXNz
L21haW50YWluZXItc29jLWNsZWFuLWR0cy5yc3QgYmVpbmcNCj5pbXBsaWVkIGZvciB0aGlzIHBs
YXRmb3JtLg0KDQotLQ0KQmVzdCBSZWdhcmRzLA0KS2V2aW4uIENoZW4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCrFIpfOqzDogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPg0KsUil86TptME6IDIwMjSmfjek6zI2pOkgpFWkyCAwOTozMw0Kpqyl86rMOiBL
ZXZpbiBDaGVuIDxrZXZpbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KsMaluzogc29jQGtlcm5lbC5v
cmcgPHNvY0BrZXJuZWwub3JnPjsgbS5zenlwcm93c2tpQHNhbXN1bmcuY29tIDxtLnN6eXByb3dz
a2lAc2Ftc3VuZy5jb20+OyBuZnJhcHJhZG9AY29sbGFib3JhLmNvbSA8bmZyYXByYWRvQGNvbGxh
Ym9yYS5jb20+OyBvbG9mQGxpeG9tLm5ldCA8b2xvZkBsaXhvbS5uZXQ+OyB3aWxsQGtlcm5lbC5v
cmcgPHdpbGxAa2VybmVsLm9yZz47IG10dXJxdWV0dGVAYmF5bGlicmUuY29tIDxtdHVycXVldHRl
QGJheWxpYnJlLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIDxsaW51eC1jbGtA
dmdlci5rZXJuZWwub3JnPjsgY29ub3IrZHRAa2VybmVsLm9yZyA8Y29ub3IrZHRAa2VybmVsLm9y
Zz47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zz47IGFuZHJld0Bjb2RlY29uc3RydWN0LmNvbS5hdSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29t
LmF1PjsgY2F0YWxpbi5tYXJpbmFzQGFybS5jb20gPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPjsg
c2JveWRAa2VybmVsLm9yZyA8c2JveWRAa2VybmVsLm9yZz47IHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGUgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+OyB1LWt1bWFyMUB0aS5jb20gPHUta3VtYXIxQHRp
LmNvbT47IGFybmRAYXJuZGIuZGUgPGFybmRAYXJuZGIuZGU+OyBqb2VsQGptcy5pZC5hdSA8am9l
bEBqbXMuaWQuYXU+OyBxdWljX2Jqb3JhbmRlQHF1aWNpbmMuY29tIDxxdWljX2Jqb3JhbmRlQHF1
aWNpbmMuY29tPjsgbGVlQGtlcm5lbC5vcmcgPGxlZUBrZXJuZWwub3JnPjsga3J6aytkdEBrZXJu
ZWwub3JnIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcgPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBsaW51eC1hc3Bl
ZWRAbGlzdHMub3psYWJzLm9yZyA8bGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc+OyBkbWl0
cnkuYmFyeXNoa292QGxpbmFyby5vcmcgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz47IHNo
YXduZ3VvQGtlcm5lbC5vcmcgPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBnZWVydCtyZW5lc2FzQGds
aWRlci5iZSA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBSb2IgSGVycmluZyAoQXJtKSA8cm9i
aEBrZXJuZWwub3JnPg0KpUSmrjogUmU6IFtQQVRDSCB2MSAwMC8xMF0gSW50cm9kdWNlIEFTUEVF
RCBBU1QyN1hYIEJNQyBTb0MNCg0KT24gMjYvMDcvMjAyNCAxNTowOSwgUm9iIEhlcnJpbmcgKEFy
bSkgd3JvdGU6DQo+DQo+IE9uIEZyaSwgMjYgSnVsIDIwMjQgMTk6MDM6NDUgKzA4MDAsIEtldmlu
IENoZW4gd3JvdGU6DQo+PiBUaGlzIHBhdGNoc2V0IGFkZHMgaW5pdGlhbCBzdXBwb3J0IGZvciB0
aGUgQVNQRUVELg0KPj4gQVNUMjdYWCBCb2FyZCBNYW5hZ2VtZW50IGNvbnRyb2xsZXIgKEJNQykg
U29DIGZhbWlseS4NCj4+DQo+PiBBU1QyNzAwIGlzIEFTUEVFRCdzIDh0aC1nZW5lcmF0aW9uIHNl
cnZlciBtYW5hZ2VtZW50IHByb2Nlc3Nvci4NCj4+IEZlYXR1cmluZyBhIHF1YWQtY29yZSBBUk0g
Q29ydGV4IEEzNSA2NC1iaXQgcHJvY2Vzc29yIGFuZCB0d28NCj4+IGluZGVwZW5kZW50IEFSTSBD
b3J0ZXggTTQgcHJvY2Vzc29ycw0KPj4NCj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyBtaW5pbWFsIGFy
Y2hpdGVjdHVyZSBhbmQgZHJpdmVycyBzdWNoIGFzOg0KPj4gQ2xvY2tzb3VyY2UsIENsb2NrIGFu
ZCBSZXNldA0KPj4NCj4+IFRoaXMgcGF0Y2hzZXQgd2FzIHRlc3RlZCBvbiB0aGUgQVNQRUVEIEFT
VDI3MDAgZXZhbHVhdGlvbiBib2FyZC4NCj4+DQo+PiBLZXZpbiBDaGVuICgxMCk6DQo+PiAgIGR0
LWJpbmRpbmc6IG1mZDogYXNwZWVkLGFzdDJ4MDAtc2N1OiBBZGQgYmluZGluZyBmb3IgQVNQRUVE
IEFTVDI3MDANCj4+ICAgICBTQ1UNCj4+ICAgZHQtYmluZGluZzogY2xrOiBhc3QyNzAwOiBBZGQg
YmluZGluZyBmb3IgQXNwZWVkIEFTVDI3eHggQ2xvY2sNCj4+ICAgY2xrOiBhc3QyNzAwOiBhZGQg
Y2xvY2sgY29udHJvbGxlcg0KPj4gICBkdC1iaW5kaW5nczogcmVzZXQ6IGFzdDI3MDA6IEFkZCBi
aW5kaW5nIGZvciBBU1BFRUQgQVNUMjcwMCBSZXNldA0KPj4gICBkdC1iaW5kaW5nczogYXJtOiBh
c3BlZWQ6IEFkZCBtYWludGFpbmVyDQo+PiAgIGR0LWJpbmRpbmdzOiBhcm06IGFzcGVlZDogQWRk
IGFzcGVlZCxhc3QyNzAwLWV2YiBjb21wYXRpYmxlIHN0cmluZw0KPj4gICBhcm02NDogYXNwZWVk
OiBBZGQgc3VwcG9ydCBmb3IgQVNQRUVEIEFTVDI3MDAgQk1DIFNvQw0KPj4gICBhcm02NDogZHRz
OiBhc3BlZWQ6IEFkZCBpbml0aWFsIEFTVDI3WFggZGV2aWNlIHRyZWUNCj4+ICAgYXJtNjQ6IGR0
czogYXNwZWVkOiBBZGQgaW5pdGlhbCBBU1QyNzAwIEVWQiBkZXZpY2UgdHJlZQ0KPj4gICBhcm02
NDogZGVmY29uZmlnOiBBZGQgQVNQRUVEIEFTVDI3MDAgZmFtaWx5IHN1cHBvcnQNCj4+DQo+PiAg
Li4uL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwgICAgICAgICAgIHwgICAgNiArDQo+
PiAgLi4uL2JpbmRpbmdzL21mZC9hc3BlZWQsYXN0MngwMC1zY3UueWFtbCAgICAgIHwgICAgMyAr
DQo+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
MyArDQo+PiAgYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyAgICAgICAgICAgICAgICAgIHwg
ICAxNCArDQo+PiAgYXJjaC9hcm02NC9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
IHwgICAgMSArDQo+PiAgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvTWFrZWZpbGUgICAgICAg
ICAgIHwgICAgNCArDQo+PiAgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc3LmR0
c2kgICAgIHwgIDIxNyArKysNCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9hc3QyNzAw
LWV2Yi5kdHMgICAgfCAgIDUwICsNCj4+ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAg
ICAgICAgICAgICAgICAgfCAgICAxICsNCj4+ICBkcml2ZXJzL2Nsay9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4+ICBkcml2ZXJzL2Nsay9jbGstYXN0MjcwMC5j
ICAgICAgICAgICAgICAgICAgICAgfCAxMTY2ICsrKysrKysrKysrKysrKysrDQo+PiAgLi4uL2R0
LWJpbmRpbmdzL2Nsb2NrL2FzcGVlZCxhc3QyNzAwLWNsay5oICAgIHwgIDE4MCArKysNCj4+ICAu
Li4vZHQtYmluZGluZ3MvcmVzZXQvYXNwZWVkLGFzdDI3MDAtcmVzZXQuaCAgfCAgMTI2ICsrDQo+
PiAgMTMgZmlsZXMgY2hhbmdlZCwgMTc3MiBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL01ha2VmaWxlDQo+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1nNy5kdHNpDQo+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL2FzdDI3MDAtZXZi
LmR0cw0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9jbGstYXN0MjcwMC5jDQo+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXNwZWVkLGFz
dDI3MDAtY2xrLmgNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9hc3BlZWQsYXN0MjcwMC1yZXNldC5oDQo+Pg0KPj4gLS0NCj4+IDIuMzQuMQ0KPj4NCj4+
DQo+Pg0KPg0KPg0KPiBNeSBib3QgZm91bmQgbmV3IERUQiB3YXJuaW5ncyBvbiB0aGUgLmR0cyBm
aWxlcyBhZGRlZCBvciBjaGFuZ2VkIGluIHRoaXMNCj4gc2VyaWVzLg0KPg0KPiBTb21lIHdhcm5p
bmdzIG1heSBiZSBmcm9tIGFuIGV4aXN0aW5nIFNvQyAuZHRzaS4gT3IgcGVyaGFwcyB0aGUgd2Fy
bmluZ3MNCj4gYXJlIGZpeGVkIGJ5IGFub3RoZXIgc2VyaWVzLiBVbHRpbWF0ZWx5LCBpdCBpcyB1
cCB0byB0aGUgcGxhdGZvcm0NCj4gbWFpbnRhaW5lciB3aGV0aGVyIHRoZXNlIHdhcm5pbmdzIGFy
ZSBhY2NlcHRhYmxlIG9yIG5vdC4gTm8gbmVlZCB0byByZXBseQ0KPiB1bmxlc3MgdGhlIHBsYXRm
b3JtIG1haW50YWluZXIgaGFzIGNvbW1lbnRzLg0KPg0KPiBJZiB5b3UgYWxyZWFkeSByYW4gRFQg
Y2hlY2tzIGFuZCBkaWRuJ3Qgc2VlIHRoZXNlIGVycm9yKHMpLCB0aGVuDQo+IG1ha2Ugc3VyZSBk
dC1zY2hlbWEgaXMgdXAgdG8gZGF0ZToNCj4NCj4gICBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11
cGdyYWRlDQo+DQo+DQo+IE5ldyB3YXJuaW5ncyBydW5uaW5nICdtYWtlIENIRUNLX0RUQlM9eSBh
c3BlZWQvYXN0MjcwMC1ldmIuZHRiJyBmb3IgMjAyNDA3MjYxMTAzNTUuMjE4MTU2My0xLWtldmlu
X2NoZW5AYXNwZWVkdGVjaC5jb206DQoNCktldmluLA0KSnVzdCB0byBjbGFyaWZ5LiBMb29raW5n
IGF0IHRoZSBwYXRjaGVzIGl0IHdhcyBxdWl0ZSBvYnZpb3VzIHlvdSBkaWQgbm90DQp0ZXN0IGl0
IHdpdGggZHRic19jaGVjay4gRm9yIGEgbmV3IGFybTY0IHBsYXRmb3JtIHdpdGhvdXQgYW55IGxl
Z2FjeSwNCmhhdmluZyAwIHdhcm5pbmdzIGlzIGEgbXVzdC4NCg0KQ29uc2lkZXIgRG9jdW1lbnRh
dGlvbi9wcm9jZXNzL21haW50YWluZXItc29jLWNsZWFuLWR0cy5yc3QgYmVpbmcNCmltcGxpZWQg
Zm9yIHRoaXMgcGxhdGZvcm0uDQoNCkJlc3QgcmVnYXJkcywNCktyenlzenRvZg0KDQoqKioqKioq
KioqKioqIEVtYWlsIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
CqdLs2TBbqn6Og0KpburSKXzKKnOqOSq/qXzKaVpr+ClXad0vvexS7jqsFShQajDqPyqa6vfq0/F
QKFDpnAgpXi63atEq/ypd6Snpqyl86rMoUG90KVIuXGkbLZspfOzcaq+pbu5caRstmyl86SntW+w
ZarMLCCow73Qpd+nWadSsKOlu7lxpGy2bKXzpM6o5Kr+pfOpTb5Qt7Sp0qazvcamTKXzoUPBwsHC
sXqquqZYp0AhDQoNCkRJU0NMQUlNRVI6DQpUaGlzIG1lc3NhZ2UgKGFuZCBhbnkgYXR0YWNobWVu
dHMpIG1heSBjb250YWluIGxlZ2FsbHkgcHJpdmlsZWdlZCBhbmQvb3Igb3RoZXIgY29uZmlkZW50
aWFsIGluZm9ybWF0aW9uLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCBpdCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFpbCBhbmQgaW1tZWRpYXRlbHkgZGVsZXRl
IHRoZSBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB3aXRob3V0IGNvcHlpbmcgb3IgZGlzY2xv
c2luZyB0aGUgY29udGVudHMuIFRoYW5rIHlvdS4NCg==

--_000_PSAPR06MB4949A360F5C5EFDF87DF741489802PSAPR06MB4949apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
Hi Krzk,</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
I will speperate clock part in the v3 patch into Ryan's clock series.</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
<br>
&gt;&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;&gt; On Fri, 26 Jul 2024 19:03:45 +0800, Kevin Chen wrote:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; This patchset adds initial support for the ASPEED.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; AST27XX Board Management controller (BMC) SoC family.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; AST2700 is ASPEED's 8th-generation server management processor=
.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; Featuring a quad-core ARM Cortex A35 64-bit processor and two<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; independent ARM Cortex M4 processors</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; This patchset adds minimal architecture and drivers such as:</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; Clocksource, Clock and Reset</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; This patchset was tested on the ASPEED AST2700 evaluation boar=
d.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; Kevin Chen (10):</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; dt-binding: mfd: aspeed,ast2x00-scu: Add binding for AS=
PEED AST2700</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; &nbsp; SCU</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; dt-binding: clk: ast2700: Add binding for Aspeed AST27x=
x Clock</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; clk: ast2700: add clock controller</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; dt-bindings: reset: ast2700: Add binding for ASPEED AST=
2700 Reset</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; dt-bindings: arm: aspeed: Add maintainer</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; dt-bindings: arm: aspeed: Add aspeed,ast2700-evb compat=
ible string</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; arm64: aspeed: Add support for ASPEED AST2700 BMC SoC</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; arm64: dts: aspeed: Add initial AST27XX device tree</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; arm64: dts: aspeed: Add initial AST2700 EVB device tree=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp; arm64: defconfig: Add ASPEED AST2700 family support</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;.../bindings/arm/aspeed/aspeed.yaml &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; | &nbsp; &nbsp;6 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;.../bindings/mfd/aspeed,ast2x00-scu.yaml &nbsp; &nbsp; &=
nbsp;| &nbsp; &nbsp;3 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;MAINTAINERS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
| &nbsp; &nbsp;3 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;arch/arm64/Kconfig.platforms &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 14 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;arch/arm64/boot/dts/Makefile &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;1 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;arch/arm64/boot/dts/aspeed/Makefile &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; | &nbsp; &nbsp;4 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi &nbsp; &nbsp; =
| &nbsp;217 +++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;arch/arm64/boot/dts/aspeed/ast2700-evb.dts &nbsp; &nbsp;=
| &nbsp; 50 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;arch/arm64/configs/defconfig &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;1 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;drivers/clk/Makefile &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;1 +</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;drivers/clk/clk-ast2700.c &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 1166 +++++++++++++++++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;.../dt-bindings/clock/aspeed,ast2700-clk.h &nbsp; &nbsp;=
| &nbsp;180 +++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;.../dt-bindings/reset/aspeed,ast2700-reset.h &nbsp;| &nb=
sp;126 ++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;13 files changed, 1772 insertions(+)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;create mode 100644 arch/arm64/boot/dts/aspeed/Makefile</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.=
dtsi</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-ev=
b.dts</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;create mode 100644 drivers/clk/clk-ast2700.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;create mode 100644 include/dt-bindings/clock/aspeed,ast2=
700-clk.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; &nbsp;create mode 100644 include/dt-bindings/reset/aspeed,ast2=
700-reset.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; --</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; 2.34.1</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; My bot found new DTB warnings on the .dts files added or changed i=
n this</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; series.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; Some warnings may be from an existing SoC .dtsi. Or perhaps the wa=
rnings</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; are fixed by another series. Ultimately, it is up to the platform<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; maintainer whether these warnings are acceptable or not. No need t=
o reply</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; unless the platform maintainer has comments.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; If you already ran DT checks and didn't see these error(s), then</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; make sure dt-schema is up to date:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; pip3 install dtschema --upgrade</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; New warnings running 'make CHECK_DTBS=3Dy aspeed/ast2700-evb.dtb' =
for 20240726110355.2181563-1-kevin_chen@aspeedtech.com:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;Kevin,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;Just to clarify. Looking at the patches it was quite obvious you did no=
t</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;test it with dtbs_check. For a new arm64 platform without any legacy,</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;having 0 warnings is a must.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Agree.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;Consider Documentation/process/maintainer-soc-clean-dts.rst being</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;implied for this platform.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
--</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Best Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Kevin. Chen</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>=B1H=A5=F3=AA=CC:</b>=
&nbsp;Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b>&nbsp;2024=A6~7=A4=EB26=A4=E9 =A4U=A4=C8 09:3=
3<br>
<b>=A6=AC=A5=F3=AA=CC:</b>&nbsp;Kevin Chen &lt;kevin_chen@aspeedtech.com&gt=
;<br>
<b>=B0=C6=A5=BB:</b>&nbsp;soc@kernel.org &lt;soc@kernel.org&gt;; m.szyprows=
ki@samsung.com &lt;m.szyprowski@samsung.com&gt;; nfraprado@collabora.com &l=
t;nfraprado@collabora.com&gt;; olof@lixom.net &lt;olof@lixom.net&gt;; will@=
kernel.org &lt;will@kernel.org&gt;; mturquette@baylibre.com &lt;mturquette@=
baylibre.com&gt;;
 linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; linux-c=
lk@vger.kernel.org &lt;linux-clk@vger.kernel.org&gt;; conor+dt@kernel.org &=
lt;conor+dt@kernel.org&gt;; devicetree@vger.kernel.org &lt;devicetree@vger.=
kernel.org&gt;; andrew@codeconstruct.com.au &lt;andrew@codeconstruct.com.au=
&gt;;
 catalin.marinas@arm.com &lt;catalin.marinas@arm.com&gt;; sboyd@kernel.org =
&lt;sboyd@kernel.org&gt;; p.zabel@pengutronix.de &lt;p.zabel@pengutronix.de=
&gt;; u-kumar1@ti.com &lt;u-kumar1@ti.com&gt;; arnd@arndb.de &lt;arnd@arndb=
.de&gt;; joel@jms.id.au &lt;joel@jms.id.au&gt;; quic_bjorande@quicinc.com
 &lt;quic_bjorande@quicinc.com&gt;; lee@kernel.org &lt;lee@kernel.org&gt;; =
krzk+dt@kernel.org &lt;krzk+dt@kernel.org&gt;; linux-arm-kernel@lists.infra=
dead.org &lt;linux-arm-kernel@lists.infradead.org&gt;; neil.armstrong@linar=
o.org &lt;neil.armstrong@linaro.org&gt;; linux-aspeed@lists.ozlabs.org
 &lt;linux-aspeed@lists.ozlabs.org&gt;; dmitry.baryshkov@linaro.org &lt;dmi=
try.baryshkov@linaro.org&gt;; shawnguo@kernel.org &lt;shawnguo@kernel.org&g=
t;; geert+renesas@glider.be &lt;geert+renesas@glider.be&gt;; Rob Herring (A=
rm) &lt;robh@kernel.org&gt;<br>
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 00/10] Introduce ASPEED AST27XX BMC S=
oC</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 26/07/2024 15:09, Rob Herring (Arm) wrot=
e:<br>
&gt;<br>
&gt; On Fri, 26 Jul 2024 19:03:45 +0800, Kevin Chen wrote:<br>
&gt;&gt; This patchset adds initial support for the ASPEED.<br>
&gt;&gt; AST27XX Board Management controller (BMC) SoC family.<br>
&gt;&gt;<br>
&gt;&gt; AST2700 is ASPEED's 8th-generation server management processor.<br=
>
&gt;&gt; Featuring a quad-core ARM Cortex A35 64-bit processor and two<br>
&gt;&gt; independent ARM Cortex M4 processors<br>
&gt;&gt;<br>
&gt;&gt; This patchset adds minimal architecture and drivers such as:<br>
&gt;&gt; Clocksource, Clock and Reset<br>
&gt;&gt;<br>
&gt;&gt; This patchset was tested on the ASPEED AST2700 evaluation board.<b=
r>
&gt;&gt;<br>
&gt;&gt; Kevin Chen (10):<br>
&gt;&gt;&nbsp;&nbsp; dt-binding: mfd: aspeed,ast2x00-scu: Add binding for A=
SPEED AST2700<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; SCU<br>
&gt;&gt;&nbsp;&nbsp; dt-binding: clk: ast2700: Add binding for Aspeed AST27=
xx Clock<br>
&gt;&gt;&nbsp;&nbsp; clk: ast2700: add clock controller<br>
&gt;&gt;&nbsp;&nbsp; dt-bindings: reset: ast2700: Add binding for ASPEED AS=
T2700 Reset<br>
&gt;&gt;&nbsp;&nbsp; dt-bindings: arm: aspeed: Add maintainer<br>
&gt;&gt;&nbsp;&nbsp; dt-bindings: arm: aspeed: Add aspeed,ast2700-evb compa=
tible string<br>
&gt;&gt;&nbsp;&nbsp; arm64: aspeed: Add support for ASPEED AST2700 BMC SoC<=
br>
&gt;&gt;&nbsp;&nbsp; arm64: dts: aspeed: Add initial AST27XX device tree<br=
>
&gt;&gt;&nbsp;&nbsp; arm64: dts: aspeed: Add initial AST2700 EVB device tre=
e<br>
&gt;&gt;&nbsp;&nbsp; arm64: defconfig: Add ASPEED AST2700 family support<br=
>
&gt;&gt;<br>
&gt;&gt;&nbsp; .../bindings/arm/aspeed/aspeed.yaml&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 6 +<br>
&gt;&gt;&nbsp; .../bindings/mfd/aspeed,ast2x00-scu.yaml&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp;&nbsp;&nbsp; 3 +<br>
&gt;&gt;&nbsp; MAINTAINERS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp;&nbsp;&nbsp; 3 +<br>
&gt;&gt;&nbsp; arch/arm64/Kconfig.platforms&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp;&nbsp; 14 +<br>
&gt;&gt;&nbsp; arch/arm64/boot/dts/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp;&nbsp;&nbsp; 1 +<br>
&gt;&gt;&nbsp; arch/arm64/boot/dts/aspeed/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 +<br>
&gt;&gt;&nbsp; arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp; 217 +++<br>
&gt;&gt;&nbsp; arch/arm64/boot/dts/aspeed/ast2700-evb.dts&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp; 50 +<br>
&gt;&gt;&nbsp; arch/arm64/configs/defconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp;&nbsp;&nbsp; 1 +<br>
&gt;&gt;&nbsp; drivers/clk/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 1 +<br>
&gt;&gt;&nbsp; drivers/clk/clk-ast2700.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | 1166 +++++++++++++++++<br>
&gt;&gt;&nbsp; .../dt-bindings/clock/aspeed,ast2700-clk.h&nbsp;&nbsp;&nbsp;=
 |&nbsp; 180 +++<br>
&gt;&gt;&nbsp; .../dt-bindings/reset/aspeed,ast2700-reset.h&nbsp; |&nbsp; 1=
26 ++<br>
&gt;&gt;&nbsp; 13 files changed, 1772 insertions(+)<br>
&gt;&gt;&nbsp; create mode 100644 arch/arm64/boot/dts/aspeed/Makefile<br>
&gt;&gt;&nbsp; create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi=
<br>
&gt;&gt;&nbsp; create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dt=
s<br>
&gt;&gt;&nbsp; create mode 100644 drivers/clk/clk-ast2700.c<br>
&gt;&gt;&nbsp; create mode 100644 include/dt-bindings/clock/aspeed,ast2700-=
clk.h<br>
&gt;&gt;&nbsp; create mode 100644 include/dt-bindings/reset/aspeed,ast2700-=
reset.h<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; My bot found new DTB warnings on the .dts files added or changed in th=
is<br>
&gt; series.<br>
&gt;<br>
&gt; Some warnings may be from an existing SoC .dtsi. Or perhaps the warnin=
gs<br>
&gt; are fixed by another series. Ultimately, it is up to the platform<br>
&gt; maintainer whether these warnings are acceptable or not. No need to re=
ply<br>
&gt; unless the platform maintainer has comments.<br>
&gt;<br>
&gt; If you already ran DT checks and didn't see these error(s), then<br>
&gt; make sure dt-schema is up to date:<br>
&gt;<br>
&gt;&nbsp;&nbsp; pip3 install dtschema --upgrade<br>
&gt;<br>
&gt;<br>
&gt; New warnings running 'make CHECK_DTBS=3Dy aspeed/ast2700-evb.dtb' for =
20240726110355.2181563-1-kevin_chen@aspeedtech.com:<br>
<br>
Kevin,<br>
Just to clarify. Looking at the patches it was quite obvious you did not<br=
>
test it with dtbs_check. For a new arm64 platform without any legacy,<br>
having 0 warnings is a must.<br>
<br>
Consider Documentation/process/maintainer-soc-clean-dts.rst being<br>
implied for this platform.<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</div>
************* Email Confidentiality Notice ********************<br>
=A7K=B3d=C1n=A9=FA:<br>
=A5=BB=ABH=A5=F3(=A9=CE=A8=E4=AA=FE=A5=F3)=A5i=AF=E0=A5]=A7t=BE=F7=B1K=B8=
=EA=B0T=A1A=A8=C3=A8=FC=AAk=AB=DF=ABO=C5@=A1C=A6p =A5x=BA=DD=ABD=AB=FC=A9w=
=A4=A7=A6=AC=A5=F3=AA=CC=A1A=BD=D0=A5H=B9q=A4l=B6l=A5=F3=B3q=AA=BE=A5=BB=B9=
q=A4l=B6l=A5=F3=A4=A7=B5o=B0e=AA=CC, =A8=C3=BD=D0=A5=DF=A7Y=A7R=B0=A3=A5=BB=
=B9q=A4l=B6l=A5=F3=A4=CE=A8=E4=AA=FE=A5=F3=A9M=BEP=B7=B4=A9=D2=A6=B3=BD=C6=
=A6L=A5=F3=A1C=C1=C2=C1=C2=B1z=AA=BA=A6X=A7@!<br>
<br>
DISCLAIMER:<br>
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing
 the contents. Thank you.
</body>
</html>

--_000_PSAPR06MB4949A360F5C5EFDF87DF741489802PSAPR06MB4949apcp_--
