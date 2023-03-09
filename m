Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93446B1C82
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:38:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLdh3Wtrz3cHX
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 18:38:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lg+58u/r;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lg+58u/r;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLdb5MYPz3brQ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 18:38:26 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-536bbef1c5eso19360567b3.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 23:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/LUZgYrR0Ysr7+Ej1P1ngFsSFpgqj0GwvWlQto+e2M=;
        b=lg+58u/rcX6KGQPiFTKChAzbGLROJbQGHgi2GeDH7tA+SuLf7B3lMURC2xAV8tmUjs
         eL2AYYrAMAKfw2GJ3rS6E0e1q5R6/WxLffLj03MaSglH3QcPM1Tgb26jkddhQKKNnl4K
         XABYDocIuff0tU/0kshegshi4OmkMUyV9QUjGRSJRWxKITpJUFX/W+2FyctkX5jRaCyP
         8HV/cIQ/36vQ6MOiSXmBdwamKtYvRqflEgOh+Nv+dekd0vux+8t7uWNBFIAEp3dJBCCT
         VdHJtm4jZAj8lZrxiKnV73HizqZ7rM4JMUTWXbE87bJGcluA4nOMrruGx6KP9QPRwL60
         l12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/LUZgYrR0Ysr7+Ej1P1ngFsSFpgqj0GwvWlQto+e2M=;
        b=LzdPpsBu56sESRmY1uj2uwSr481//WJSltlfvtBp6i4vxP0WA3t9HDrPxJ4s7V6dsa
         e50+YRpCnEUoiq37O9s4s4g/9OXDtL/E31QDg0j8asKulNDPUCRjOkAKD+RA2kxkCPrZ
         GaDPDI59TwpgJj9XsT+dmNik2u9wMvssTL3rWW1drlVE7qu2Ow7RAu6/FXNLNYUXQ2gd
         B9e+TuzBO77+Z9vCl99tPvv48f3PcazxqvRME3Ors/4sHB7CsBzF6L00zVRtiZEFb3s0
         0JoIz8uo5K2QJqdArIrXMFDvBqM+cM4SKZJsd972IOFqk9GUxHgBv0FZM6ywXndDtpEV
         xvZA==
X-Gm-Message-State: AO0yUKUZHehENzZ/GNRSiQpMJqeYvKV7fOgIG1iLp5ep0Ygkd6ZMy7/A
	E49XhEeu2RhqTU6MBouFjqEpPlB/7WhOrYqAf8EjFg==
X-Google-Smtp-Source: AK7set+9L5i2dic4vjPaEUChT97wsmBnVt2hJYHC48czJtDtf4Yau2W0U2eTlSW/M6bcbCj5zYcbrf3yuIFHsYNbXWU=
X-Received: by 2002:a81:b615:0:b0:52e:c77d:3739 with SMTP id
 u21-20020a81b615000000b0052ec77d3739mr12131466ywh.9.1678347502993; Wed, 08
 Mar 2023 23:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20230309050855.3311834-1-joel@jms.id.au>
In-Reply-To: <20230309050855.3311834-1-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 08:38:11 +0100
Message-ID: <CACRpkdba--WpCGEF7jF=oWowps1JpieoTo6UswcCZyvs2s5z6g@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Always register the irqchip
To: Joel Stanley <joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 9, 2023 at 6:09=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrote:

> The driver was implemented in a way that made the irqchip optional, if a
> irq was not present in the device tree. However, all of the device trees
> have always had an irq, so the optional-ness has never been used.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Linus, feel free to put this in your immutable gpiochip series

Perfect, I will merge it into my v3 set to help Bartosz avoid merge
conflicts.

Yours,
Linus Walleij
