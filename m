Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B74258469
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 01:28:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgRFv56hqzDqVv
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 09:28:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.249; helo=lelv0142.ext.ti.com;
 envelope-from=t-kristo@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=HE2uD3n8; 
 dkim-atps=neutral
X-Greylist: delayed 2310 seconds by postgrey-1.36 at bilbo;
 Thu, 27 Aug 2020 17:52:19 AEST
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZh30c4HzDqFK
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Aug 2020 17:52:17 +1000 (AEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R7DL4O119558;
 Thu, 27 Aug 2020 02:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598512401;
 bh=chnLtvlLfmkpGeV2vsBUHPMDpbA5Sy+7t6PEefYVFVY=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=HE2uD3n8TXdGxw/mEb6K4mrLusTjCtNkoYcikFDgoo8p1WepKo4QRnHnUqwz6ahZi
 UQZ9eFvxLL3w1/36UTjRGVMMV5gMT7TxtvMGwkTEU5873v+3DvBXK/awU3wdmZ9tUR
 +Lmwi9u6F5mN/pk0MQvkwF7TVfwdwXVrT+aan+RA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R7DLmc017430;
 Thu, 27 Aug 2020 02:13:21 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 02:13:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 02:13:20 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R7DHh8126345;
 Thu, 27 Aug 2020 02:13:17 -0500
Subject: Re: [PATCH 2/2] EDAC/ti: Fix handling of platform_get_irq() error
To: Krzysztof Kozlowski <krzk@kernel.org>, Stefan Schaeckeler
 <sschaeck@cisco.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, James Morse
 <james.morse@arm.com>, Robert Richter <rric@kernel.org>, Joel Stanley
 <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, <linux-edac@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
References: <20200827070743.26628-1-krzk@kernel.org>
 <20200827070743.26628-2-krzk@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <1a92f43b-5358-169f-7dd8-1860a26d9861@ti.com>
Date: Thu, 27 Aug 2020 10:13:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827070743.26628-2-krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 01 Sep 2020 09:27:42 +1000
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 27/08/2020 10:07, Krzysztof Kozlowski wrote:
> platform_get_irq() returns -ERRNO on error.  In such case comparison
> to 0 would pass the check.
> 
> Fixes: 86a18ee21e5e ("EDAC, ti: Add support for TI keystone and DRA7xx EDAC")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Tero Kristo <t-kristo@ti.com>

> ---
>   drivers/edac/ti_edac.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/ti_edac.c b/drivers/edac/ti_edac.c
> index 6e52796a0b41..e7eae20f83d1 100644
> --- a/drivers/edac/ti_edac.c
> +++ b/drivers/edac/ti_edac.c
> @@ -278,7 +278,8 @@ static int ti_edac_probe(struct platform_device *pdev)
>   
>   	/* add EMIF ECC error handler */
>   	error_irq = platform_get_irq(pdev, 0);
> -	if (!error_irq) {
> +	if (error_irq < 0) {
> +		ret = error_irq;
>   		edac_printk(KERN_ERR, EDAC_MOD_NAME,
>   			    "EMIF irq number not defined.\n");
>   		goto err;
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
