Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BD01476A4
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jan 2020 02:22:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483hGS2cCQzDqZX
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jan 2020 12:22:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ldMSr6Br; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483hGL61qhzDqWw
 for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jan 2020 12:22:48 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id e5so337002qtm.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jan 2020 17:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=phGwo+pDXf6bF+gF8aK5SXhe6NHtsdTb5Ox/q8isBRk=;
 b=ldMSr6BrgSIK0aY1BELR8h72NuIAXhgOVdDnjW8N7nx/HKdDhfOLZr3NLQy6yQ3yIi
 YWiAnx5adD1yMX2mlaqBGRLCX8Cec4O2/h+whOq90/e4Nm98MlfGtuWRtIfJzex80527
 5lkmtfLK+whfgwlnuGZJdPajF59rIS4SRcX4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=phGwo+pDXf6bF+gF8aK5SXhe6NHtsdTb5Ox/q8isBRk=;
 b=J+J8RaMp6up/Q51Clf3RtxXBzvOJ0Wp9K6vKQUuXJmzBazd/CbSPI/RZRhr+v5LE6X
 6CG+ozYyphcqbFjvTm7R9cEjokVFXF8iqdks6VvWYCrcfDAU2zoPUoxPbao1GdmjtHG9
 onxhQvijA1ieWrtoHfb/nTJPrOdjnj4UHxoJnFPJPNfHc4yuGyOJSQuSjnpeJZo6NHlz
 svKNFE0L2g6RaexyyU8UVf40HiAjTyQ7ROY/d8GvVjev2oxvM+iAR/SRVP/rVBRWATgA
 govTw5XLWzCTfK2vDoC0GIrOVOtb2PDx/RUgYT0OFdFmXShFuqjTSrdQtDQqoM0G7s2U
 ZqKQ==
X-Gm-Message-State: APjAAAWMfgEqU2JUibxl7eeAfjQUacZrMe24E+xUsdb33qzhBUwbSWrA
 siklQHcRt37GzlVP5pKHIfqMt9+KsrIka+7gPIk=
X-Google-Smtp-Source: APXvYqxgfz4Zw0PQe3tGHa9Wg4sjEbGekFBUPqOcMg5JxkIQChmOWlM1gWfBxIkoJXDoObnt764EEJ+L6PXnaUm63tA=
X-Received: by 2002:ac8:1ac1:: with SMTP id h1mr1008470qtk.255.1579828965827; 
 Thu, 23 Jan 2020 17:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20200124011808.18801-1-sashal@kernel.org>
In-Reply-To: <20200124011808.18801-1-sashal@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jan 2020 01:22:33 +0000
Message-ID: <CACPK8XdNmF0GN_PkXttSmvAVSqUh7FtDzYOD-=LFeL-0=NHOkA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.9 1/2] ARM: config: aspeed-g5: Enable 8250_DW
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
> index 4f366b0370e93..3fb6bcba79942 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -53,6 +53,7 @@ CONFIG_SERIAL_8250_NR_UARTS=3D6
>  CONFIG_SERIAL_8250_RUNTIME_UARTS=3D6
>  CONFIG_SERIAL_8250_EXTENDED=3Dy
>  CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> +CONFIG_SERIAL_8250_DW=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
>  # CONFIG_HW_RANDOM is not set
>  # CONFIG_USB_SUPPORT is not set
> --
> 2.20.1
>
