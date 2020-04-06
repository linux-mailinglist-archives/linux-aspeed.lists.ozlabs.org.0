Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E944719EF0F
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Apr 2020 03:20:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wXly2zZZzDqV7
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Apr 2020 11:20:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HBkyOKI6; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wXll3b1xzDqTW
 for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Apr 2020 11:20:16 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id i186so5733851qke.1
 for <linux-aspeed@lists.ozlabs.org>; Sun, 05 Apr 2020 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PsmsZgemCvhriIQAgZ8Jrnu1V0u0Uy80i+4ks6YOumc=;
 b=HBkyOKI64T1XZ3uIg75dUY22JSUM5cbP/qn1UGHhdCmjF6sSrR7GhfznJT9SM18EX/
 B8iSH7m45ijOV4k+bl14QNVToBrmSm8lS+yfkMmLvmb02xYDo7M1o7hCikdokcKz1pez
 aOf8ZZ2Os4xtY2wKma46hfx3yoTH4wNjTBwvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PsmsZgemCvhriIQAgZ8Jrnu1V0u0Uy80i+4ks6YOumc=;
 b=KgrkJs115AO1x2VA3PkM3YuETD9UW9ZXkikCSJFxUCoJlVs5MdwJNRCKCNkl7Kq87S
 ovgKkzcIZJipJyuREFpsPEb2Lnxs72Sbxute3IBglivoleKZ/6HbNtDrRPRyxxlcOQCO
 kJhxgFHGI5r3iZuabiV2PHqxX8Ipi9tkqrPGkDO32/NBzvxqbzdaRkjqbzxpGP2S5DZr
 8QwvHJ3Q/x8FUdLMpnBP4OfzFflME5/XQ0QjQXiOoAQSWLb4FXzDQEO5GW1Vhgs+KLT4
 iblnX+KryXZwlA/aKI9PpvAS4EbYSfZmjHwbLbcydDSZ0X17xkV0TuEFtUeQ8dIjfsX8
 5qaw==
X-Gm-Message-State: AGi0PubizjqkVrLic0smyg/6ff/RiPkAGQT75aTQynQd4wqP3hs+4GzI
 I4AmxFT/PB5h+gWNPH8P6DhTZih7g8EqpksMJ0k=
X-Google-Smtp-Source: APiQypJ3e6qTmPGYSNjcv8HM2bboVabW4Mrp2r84r0j7tlusts/GgMm6UHPe2ubJX85/zQRv4hnNIBAI+Hss+FJs/DI=
X-Received: by 2002:a37:2f43:: with SMTP id v64mr7863822qkh.330.1586136013201; 
 Sun, 05 Apr 2020 18:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200404153631.103549-1-linux@roeck-us.net>
In-Reply-To: <20200404153631.103549-1-linux@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Apr 2020 01:20:01 +0000
Message-ID: <CACPK8Xdmjp0qg0JHHnR1MJp7zmuZHCHTOs7+qn5_16oLbe+r+g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Compile files in controllers/ directory
To: Guenter Roeck <linux@roeck-us.net>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 4 Apr 2020 at 15:37, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code
> split") moved various files into a new directory, but did not add the new
> directory to its parent directory Makefile. The moved files no longer
> build, and affected flash chips no longer instantiate.
>
> Adding the new directory to the parent directory Makefile fixes the
> problem.
>
> Fixes: a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code split")
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks Guenter. I just discovered this too.

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 7ddb742de1fe..653923896205 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -18,3 +18,5 @@ spi-nor-objs                  += winbond.o
>  spi-nor-objs                   += xilinx.o
>  spi-nor-objs                   += xmc.o
>  obj-$(CONFIG_MTD_SPI_NOR)      += spi-nor.o
> +
> +obj-$(CONFIG_MTD_SPI_NOR)      += controllers/
> --
> 2.17.1
>
