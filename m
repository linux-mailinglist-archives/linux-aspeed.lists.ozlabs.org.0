Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D95D57BFA9F
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 14:02:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xCqq8she;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4ZJz5N3cz2yVv
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 23:02:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xCqq8she;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4ZJn3rfJz2yVG
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Oct 2023 23:02:15 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7b91faf40so11776097b3.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Oct 2023 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939330; x=1697544130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wBmjqlIuY6Zt3anxCmFrS7RpdSFcEoQFexeps6+6pY=;
        b=xCqq8shesqXCCafP0F40xrNnIXS+z/YR0BBTmzvj8Ll7clxXoUmTOZC2MC2BH69eft
         e3I9uBzzeCVsY6+ZMhfblLm413FE3l5ceXPImo2WgEY5qhv2qEN23bVClRXEaCReZLi3
         nf+YQtZBHayNbLwLjqLPty2Zpd0HbWDLg6rKrdmEPsSZubd6ioWNAHCP2KinJDpHVq4x
         YhvfdPqv00mTzFANf/7lzpZOGZvQG4T0yO3mseJVEfRGcPivLUdE9ZFbHS1rmNtnXCNy
         o1Ltmql8mkOrqrIelkKrL3ib6A1NkeWQntKQ6OKuxetpUj15nX+DooFfyGXzeeE0oqmb
         lP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939330; x=1697544130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wBmjqlIuY6Zt3anxCmFrS7RpdSFcEoQFexeps6+6pY=;
        b=PjBPJ7LlaoC2nnMow2pFxVXQB8rzAB7hFenpmPKOP7KRxg/2AiekJOfGGut3IjVLoQ
         djF9FfRqGETg0vkwXskW5wwF0uwWwVIzEsBMYou0XJGJKf8uK2wTf3rC37/ssRLRDo2D
         aGcjncz/fYJ0Hn9HfPs4XP2K5KewAqAswT724K8IdKJvoit1dIpiDtJb9kt1Hp8DQQkr
         O/2nJmW3euhQxjWJhvZdfESaS2hGOJz5fUr/Xef9Cm0fqFTcpSdiMstrc1OlCXr1Nq1K
         Ss0ow6Tay6cdguEyUqaAbY90seqTXry7NeQpMinST2MUDBTIV7GWX4fpwwpv2WE3F9Ir
         9ZHA==
X-Gm-Message-State: AOJu0YwRvnpBaciWxP+HfqHo82tu94MYl0gOH2Bt4hjLKppy/KD287Lw
	kkXnY06UmH/o3qrAAYPNJ2KlAYB38OZAyH/2921Hmg==
X-Google-Smtp-Source: AGHT+IG23K04t+lvBS9/HwvoXXibHWZT2x93Gqx7aXMv0MEjbeY28YO9n63irEBhuu2GkQHI23S6u1dmnLY+nMNTZc4=
X-Received: by 2002:a05:690c:d87:b0:5a5:7ed:cf80 with SMTP id
 da7-20020a05690c0d8700b005a507edcf80mr20364608ywb.23.1696939329657; Tue, 10
 Oct 2023 05:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231005030849.11352-2-zev@bewilderbeest.net>
In-Reply-To: <20231005030849.11352-2-zev@bewilderbeest.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Oct 2023 14:01:58 +0200
Message-ID: <CACRpkdZDBmUMY7pVxtSkVQnm9bHp+ObfmumO39j=XYeDJaD7Dw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Allow changing SPI mode from hardware
 strap defaults
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Oct 5, 2023 at 5:09=E2=80=AFAM Zev Weiss <zev@bewilderbeest.net> wr=
ote:


> Some platforms unfortunately have their SPI mode selection bits
> strapped incorrectly (such as being configured for passthrough mode
> when master mode is in fact the only useful configuration for it) and
> thus require correction in software.  Add the SPI mode bits to the
> GPIO passthrough bits as the exceptions to the read-only rule for the
> hardware strap register so that the pinctrl subsystem can be used for
> such corrections.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Patch applied!

Yours,
Linus Walleij
