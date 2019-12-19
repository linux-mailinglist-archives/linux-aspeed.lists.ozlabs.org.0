Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E3125B7F
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 07:33:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dhsN6YhHzDqnv
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 17:33:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="lLeJypJQ"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dhsF32RbzDqmb
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 17:33:21 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0B1C00F1A577DA89A48CEF.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:1c00:f1a5:77da:89a4:8cef])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D82261EC0591;
 Thu, 19 Dec 2019 07:33:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1576737198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=A8v0UScqy+VRCDlp7lUVd1ltvewhL45ATvd1nYKuRsc=;
 b=lLeJypJQfPDH+3H4SlQKaWlSj3Yy1nMu9DplKTE4kBJAHU8R7JpDa9qVC5XR6RTEEANawI
 8JCxfRMwDm5EFjj4X0pt2yTnXGcADEDrD1t4oUpRrassvg7Toaqnyx4j/TGqpAfbYX+j23
 dS56sEWwbyaidzW8tKAo9cKXBmvOAqo=
Date: Thu, 19 Dec 2019 07:33:12 +0100
From: Borislav Petkov <bp@alien8.de>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] EDAC: aspeed: Remove unneeded semicolon
Message-ID: <20191219063312.GC32039@zn.tnic>
References: <1576648806-1114-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576648806-1114-1-git-send-email-vulab@iscas.ac.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: tony.luck@intel.com, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, james.morse@arm.com,
 sschaeck@cisco.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 18, 2019 at 06:00:06AM +0000, Xu Wang wrote:
> Remove unneeded semicolon reported by coccinelle.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/edac/aspeed_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
> index 09a9e3d..b194658b 100644
> --- a/drivers/edac/aspeed_edac.c
> +++ b/drivers/edac/aspeed_edac.c
> @@ -243,7 +243,7 @@ static int init_csrows(struct mem_ctl_info *mci)
>  	if (!np) {
>  		dev_err(mci->pdev, "dt: missing /memory node\n");
>  		return -ENODEV;
> -	};
> +	}
>  
>  	rc = of_address_to_resource(np, 0, &r);
>  
> @@ -252,7 +252,7 @@ static int init_csrows(struct mem_ctl_info *mci)
>  	if (rc) {
>  		dev_err(mci->pdev, "dt: failed requesting resource for /memory node\n");
>  		return rc;
> -	};
> +	}
>  
>  	dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
>  		r.start, resource_size(&r), PAGE_SHIFT);
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
