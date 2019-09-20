Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB461B8AA3
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 07:51:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZNBp6dnJzF0jG
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 15:51:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NwUzUyXe"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZNBh0x6yzDsP3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2019 15:51:37 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id c3so7318673qtv.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2019 22:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NlvPOwDHP1C+DxH46ciGbIQ82Gp/fdmy+p/JFJtAVTI=;
 b=NwUzUyXe+el4peKjNQG4O79OvKdtXAG8r0J4SNnG7hpdxb5bj+ErhCHnYWmyZwpfrR
 yYzgALwnMwMJu8WsDBxH4j3WjHqbrCW/fchFpQkTd/gTlkJku2wHf4JyAWd8/MnooPSZ
 qdIovw70JerTxtUcOENkNn1/HzmKUPXpnvjVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NlvPOwDHP1C+DxH46ciGbIQ82Gp/fdmy+p/JFJtAVTI=;
 b=j1t89w9+T70qB2r95LNQRAiu51giSGQsGCqnftgnM5S3dYF6HOOiLFA7qRRmYtTpG/
 ZKs6FffIV1GlBUmhnFWHPv+hgNARIcYrvRMQrdQdrxZR7DmjZMt341xDjaL8sBysxWa3
 9LhAbIYCxTSX2+vK52nfo7eoMK2MMcoYtT5PgSYxFoA3SMSznS/B6ltsHnKKh33Glulz
 ZCLtQ3N5glUlPfpmwaWlvkDqbWMQ/YnUcbGbDibrknYEPHPwQRofpVvjBVwGPZIiWEkk
 KE6L3wBcAggjuVN320AEls1/JRqCJlS09cAvHHkK+VBwffunvKwP+fZ54CjJetGZcmnk
 LjTg==
X-Gm-Message-State: APjAAAU1EFJa0eiy3UhFnMKjFJj7i1woAtn2KyG4f3g0cKnHlY7jmuJc
 xAhpMUnfhWzNyDPzbVNrX+82upwA4vc+NoioYlQ=
X-Google-Smtp-Source: APXvYqw8YKLoRzDRPZmO4NDOIYrRQ0VYcNB8pOGBy4Dn4po2+LJmGgZJC1+QZHzwPn1XmvwamosioDNR5Hr2A+ZYVOY=
X-Received: by 2002:ac8:2e94:: with SMTP id h20mr1491513qta.234.1568958691283; 
 Thu, 19 Sep 2019 22:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190919142654.1578823-1-arnd@arndb.de>
In-Reply-To: <20190919142654.1578823-1-arnd@arndb.de>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 05:51:18 +0000
Message-ID: <CACPK8XcsegR5R0nkiZ-UEMgCqNMggCXjAr2N-6J1S6mEhGLrBQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: aspeed: ast2500 is ARMv6K
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 19 Sep 2019 at 14:27, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Linux supports both the original ARMv6 level (early ARM1136) and ARMv6K
> (later ARM1136, ARM1176 and ARM11mpcore).
>
> ast2500 falls into the second categoy, being based on arm1176jzf-s.
> This is enabled by default when using ARCH_MULTI_V6, so we should
> not 'select CPU_V6'.
>
> Removing this will lead to more efficient use of atomic instructions.

Wow, nice find.

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-aspeed/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index a293137f5814..163931a03136 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -26,7 +26,6 @@ config MACH_ASPEED_G4
>  config MACH_ASPEED_G5
>         bool "Aspeed SoC 5th Generation"
>         depends on ARCH_MULTI_V6
> -       select CPU_V6
>         select PINCTRL_ASPEED_G5 if !CC_IS_CLANG

I can't find any trees with !CC_IS_CLANG here. Is there a problem
building our pinmux driver with Clang?

I tested with this patch:

--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -25,8 +25,8 @@ config MACH_ASPEED_G4

 config MACH_ASPEED_G5
        bool "Aspeed SoC 5th Generation"
+       # This implies ARMv6K which covers the ARM1176
        depends on ARCH_MULTI_V6
-       select CPU_V6
        select PINCTRL_ASPEED_G5
        select FTTMR010_TIMER
        help

If you want to apply that as a fix for 5.4 I would be happy with that.

Fixes: 8c2ed9bcfbeb ("arm: Add Aspeed machine")
Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
