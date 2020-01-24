Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B4A1476A8
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jan 2020 02:23:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483hGz3HcJzDqZH
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jan 2020 12:23:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eFwuIq38; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483hGn3XFRzDqDX
 for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jan 2020 12:23:13 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id d9so310530qte.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jan 2020 17:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+JCfN+nSKvj6z6tQnbylC4tnVuTXLYg++T8pHk3n1Rs=;
 b=eFwuIq388GfKUC6GUKdGzBK6GS8QptU0z6snMlcCeYTB3OaEDOZ8Jp5i/8m/E4MMgs
 +mu3AnfZEzmniI06Z8QY4BWKEfa1omxAnAQLDJEXq+X4QN1LQHxhyUK2ltD7Qfwep/vv
 dpXNOopKQBKiOxQ4TmC2BZlLeLUJ4V8yvSHsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+JCfN+nSKvj6z6tQnbylC4tnVuTXLYg++T8pHk3n1Rs=;
 b=XawU+3S9VMdopVWGMyx40715XxCxaohBJ5HGYpF/6cochXnFfZZhDQLj5RxVWOok+2
 onZ0pMCkBfg7VxW3FUG+h3kj5DrStKZlijljtnhRqWWy6Z1bu/WbwY59xYGLZlI/45Go
 NB7YoWkKfnMdeaAlYPIGa4ffIQEcKR2aKOkVsGbj62DmVG9qJxLwPiufvAAaVi/TORJi
 KAEF2TW2AVhZZhIUPzSQKexv/fRnhdSzu2Ng6oUBwXroG12u7tyo4oDOEmbc43/uWbyC
 2cbUpG/WBDADMI6g4m9XErg0hv4DwHSlcBj5HvkJtIA3WTCow3p6EN9RFPdjrPBQW4Ep
 jaWQ==
X-Gm-Message-State: APjAAAUEybTQzBc9QodaVMxaQkAupt+/bbJoZODNBR7g3oiHVZuTKw8w
 fhVQ6xQXvpDZ8DJsiwWAwLkp3eWQ238XMQJ2X50=
X-Google-Smtp-Source: APXvYqxTqcFmlwZcBGSX8ZImKVjjr5b8leE8AoohXrep2/0vxHoDMlibAChu/aMO2jSWaB/SxV3cSnP5w6RVZVwCoT8=
X-Received: by 2002:ac8:4244:: with SMTP id r4mr1014134qtm.169.1579828989644; 
 Thu, 23 Jan 2020 17:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20200124011801.18712-1-sashal@kernel.org>
 <20200124011801.18712-3-sashal@kernel.org>
In-Reply-To: <20200124011801.18712-3-sashal@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jan 2020 01:22:57 +0000
Message-ID: <CACPK8XdJ8=+SNws2NCjKeX8PRa2wV-J0wzAuWUiP6miL-TioNw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.14 3/5] ARM: config: aspeed-g5: Enable 8250_DW
 quirks
To: Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jan 2020 at 01:18, Sasha Levin <sashal@kernel.org> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> [ Upstream commit a5331a7a87ec81d5228b7421acf831b2d0c0de26 ]
>
> This driver option is used by the AST2600 A0 boards to work around a
> hardware issue.

This hardware was only supported from 5.4+, so I think we can drop this pat=
ch.

Cheers,

Joel

>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspe=
ed_g5_defconfig
> index c0ad7b82086bd..cb23f8ade3e2b 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -110,6 +110,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=3D6
>  CONFIG_SERIAL_8250_EXTENDED=3Dy
>  CONFIG_SERIAL_8250_ASPEED_VUART=3Dy
>  CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> +CONFIG_SERIAL_8250_DW=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
>  CONFIG_ASPEED_BT_IPMI_BMC=3Dy
>  # CONFIG_HW_RANDOM is not set
> --
> 2.20.1
>
