Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD926850B
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 08:39:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqcCP0cl8zDqXM
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 16:39:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KM43qRmI; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqcCJ1njTzDqPw
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Sep 2020 16:39:08 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id j11so21593951ejk.0
 for <linux-aspeed@lists.ozlabs.org>; Sun, 13 Sep 2020 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tM1rt0vCMPBG29FozlgK4tPcKJfgi5TlJoa0v0rD7zo=;
 b=KM43qRmICDk1SaQ1VXMUHX+8tngtm6ts9le/JiSXTFcxsA4Rn545KbrS6sbua4lvB6
 55oFrksVPZKrTSkYogsSedq0HvH+7BnTvkNsKjTX8YbbnNv9LWYp3KAOZuNYjrzekkso
 g15xcuUW7Pp9ctrMAJdkZx7E67oOI6E/iPPjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tM1rt0vCMPBG29FozlgK4tPcKJfgi5TlJoa0v0rD7zo=;
 b=C4aFTQqklm1MW5p8K6Gl51zRgNmS3cYIdnPJdFlR9qsUOBbnc7pQmOUcdS4USjnQTK
 CdWkUYpvYsgWkUghSpt/gbBFqhfWjExXOXN+Qb1iznkXtPn7FYiIIk7rjnepIqJOeuT9
 T6XuZToXhf2U5HPtupmxiNfz9On0gSIjqoR9fHzkSk7W3kmAzMZ0hkZWfuGKdNT9Dv25
 6cUE/K/7mBMI+PNxmZQ9ckiRnrtit77UR2LOdC0bQ16SGYZBfsmJBA8OXd0YzIt8YB/A
 ZvmEu/QV3ujteGS1R+UQj3jTkZSlblBjBAcKNs1caz9gSVPGYb4nlcHmodOdwlf4DoHT
 XSgA==
X-Gm-Message-State: AOAM53227hfwqsuXUPpwnkHBgN5FiTi5NtEV/HFvzlBeQ9sYlYg2sTmi
 JOB63fMvaLqgolhpUG8dj9sBnPXvNictu9dIZqo=
X-Google-Smtp-Source: ABdhPJzrrj2gAuLbkZT1NZHl72TkCiS8KlLa+esbZG3y0tjiUqQYdjdE8GIcrDf9ZRv0CeN9WMiieM2monhZa1/DE5s=
X-Received: by 2002:a17:906:4c58:: with SMTP id
 d24mr13673692ejw.108.1600065543130; 
 Sun, 13 Sep 2020 23:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200914065358.3726216-1-liushixin2@huawei.com>
In-Reply-To: <20200914065358.3726216-1-liushixin2@huawei.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Sep 2020 06:38:50 +0000
Message-ID: <CACPK8XdWAFjdmsr6nRtuvK95DOrq2C39WHjG+ZHvHGEVP4kE_w@mail.gmail.com>
Subject: Re: [PATCH -next] EDAC/aspeed: use module_platform_driver to simplify
 the code
To: Liu Shixin <liushixin2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
 James Morse <james.morse@arm.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Stefan Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 14 Sep 2020 at 06:31, Liu Shixin <liushixin2@huawei.com> wrote:
>
> module_platform_driver() makes the code simpler by eliminating
> boilerplate code.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/edac/aspeed_edac.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
> index fbec28dc661d..fde809efc520 100644
> --- a/drivers/edac/aspeed_edac.c
> +++ b/drivers/edac/aspeed_edac.c
> @@ -388,23 +388,7 @@ static struct platform_driver aspeed_driver = {
>         .probe          = aspeed_probe,
>         .remove         = aspeed_remove
>  };
> -
> -
> -static int __init aspeed_init(void)
> -{
> -       return platform_driver_register(&aspeed_driver);
> -}
> -
> -
> -static void __exit aspeed_exit(void)
> -{
> -       platform_driver_unregister(&aspeed_driver);
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
> 2.25.1
>
