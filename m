Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347B26CB68
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 22:27:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsBTd1x8GzDqjd
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 06:27:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsBSy4mZZzDqPC
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 06:26:23 +1000 (AEST)
Received: from zn.tnic (p200300ec2f0c3e00db2f62bd592f04a0.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:3e00:db2f:62bd:592f:4a0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1522C1EC026F;
 Wed, 16 Sep 2020 19:22:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1600276960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=CXiDzhd51Y1X9PUqSzctKBUMynV+tiDkIpdtvyBec+o=;
 b=FA22T5GORdlesUNedODvDvgYmaDdj8PkbyqTIBGIJGmwPSV7OwXITkTe+/heqhPzL51mx/
 pz9TN+9/aavENJg5AcMKLXQbd8fQkM/a7YpcMLiW6VU6TuZrjI1W39VNhvn1DoPE0GxQtm
 LTCrTJdKJtIOJzBUC8dhq1g4Pd1Q8lE=
Date: Wed, 16 Sep 2020 19:22:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: Liu Shixin <liushixin2@huawei.com>
Subject: Re: [PATCH -next] EDAC/aspeed: use module_platform_driver to
 simplify the code
Message-ID: <20200916172238.GQ2643@zn.tnic>
References: <20200914065358.3726216-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200914065358.3726216-1-liushixin2@huawei.com>
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
Cc: Tony Luck <tony.luck@intel.com>, Robert Richter <rric@kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Stefan Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 14, 2020 at 02:53:58PM +0800, Liu Shixin wrote:
> module_platform_driver() makes the code simpler by eliminating
> boilerplate code.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/edac/aspeed_edac.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
> index fbec28dc661d..fde809efc520 100644
> --- a/drivers/edac/aspeed_edac.c
> +++ b/drivers/edac/aspeed_edac.c
> @@ -388,23 +388,7 @@ static struct platform_driver aspeed_driver = {
>  	.probe		= aspeed_probe,
>  	.remove		= aspeed_remove
>  };
> -
> -
> -static int __init aspeed_init(void)
> -{
> -	return platform_driver_register(&aspeed_driver);
> -}
> -
> -
> -static void __exit aspeed_exit(void)
> -{
> -	platform_driver_unregister(&aspeed_driver);
> -}
> -
> -
> -module_init(aspeed_init);
> -module_exit(aspeed_exit);
> -
> +module_platform_driver(aspeed_driver);
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Stefan Schaeckeler <sschaeck@cisco.com>");
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
