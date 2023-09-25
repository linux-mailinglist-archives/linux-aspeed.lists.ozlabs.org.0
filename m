Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C26C7AD8C0
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Sep 2023 15:16:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fj75APOb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvNgY65Mbz3cb5
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Sep 2023 23:16:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fj75APOb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvNfN6R1Rz3cCT
	for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Sep 2023 23:15:39 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-579de633419so76631867b3.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Sep 2023 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695647734; x=1696252534; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcC37wQSlviDQDGelF47pyhsR+4+hM7dLjLOaaG5IJ4=;
        b=Fj75APObbljnOl02VfQYNQBDb3L5b4551BSoKQGNUSlCyhVnkvT0RMj3JwQQi6h59e
         KqAGJ7fFP9/3z6j8dkhaOLGVL9ACprExvC+xD/3Y7rjwAbljoqGXG/nN6vXLOgJ0fc44
         SHZIJ6gt7wm0Q8sWNcFEo+zHxLvPP3tnVi2S/y1DxwJaUqDA6Ti7GEd8W4tCCVmr3kee
         QtZcId0opgNPLPGOnOEskyvrhXNH8j6DxLgpHjchGzTTfs/dNuWYQM7LyCsC21U8VRNc
         hasLQ5V9UiiooC5W8ipmr4wD1qGll4IiB9i+vdx0ql0usCfzODsNdQF2/ynuGsFUHG9s
         bArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695647734; x=1696252534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcC37wQSlviDQDGelF47pyhsR+4+hM7dLjLOaaG5IJ4=;
        b=nqfCC0RC7f2RJT0xHSdS/qhVR6tj1+NCVkIDinJzRZVqFD1cxlsRwUWa81PN0XQc/m
         I4Vi3K2Y+4wLhcw4Uw9T0rFqIIdj4miSi1kScHZGWAAOyGP3pfXz5gh6KK80QUK7jixS
         yu3msYKhSCRyIhZNQcBZIqoDjKqw5JARrOySOwCVAHgJv9CTKaFvGVtRMF90kR0zzHlr
         nBs51g0sd/m+Gx7NIK6ISLcj61b8tLxsPP4ED1Fu3NziLGQ61dnRJbeoEfANMk+6GRIr
         nUqxuXzAU6zIfnmRUGj+e9ansjjyFD5huP5BP9z0SPPT2gJr2AwbT3ZOMWxmrDZZQfC3
         qSNg==
X-Gm-Message-State: AOJu0YyPPkEn+Dlq4GWHagBxBYdiYcvzCTWGW4/uTBZ26onxo0WEnmhh
	aW1oaqorQ5uha8ebEpzidCkFHxO0lMHKFYUFA61dUA==
X-Google-Smtp-Source: AGHT+IGItYvswC2u29u8Avn3i2K5RB+tU2XzlzVbCIQUyAgfXNs59SBMHMovhmBPOhzKl7FIGgTIlg3vauP/2uAKAhU=
X-Received: by 2002:a05:690c:23c1:b0:59f:4c75:1314 with SMTP id
 do1-20020a05690c23c100b0059f4c751314mr5692718ywb.4.1695647734133; Mon, 25 Sep
 2023 06:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230920103332.274151-1-joe_wang@aspeedtech.com>
In-Reply-To: <20230920103332.274151-1-joe_wang@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Sep 2023 15:15:22 +0200
Message-ID: <CACRpkdaZb+V-Zx_Uw9MCqRqE+N-0gd__xEFV3BTpkG7icU9W+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-aspeed-g6: Add more settings for USB2AHP function
To: Joe Wang <joe_wang@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 20, 2023 at 12:33=E2=80=AFPM Joe Wang <joe_wang@aspeedtech.com>=
 wrote:

> AST2600 USB2AHP (USB PortA: PCIe EHCI to PHY) function needs to set the
> register SCUC20[16]. Set it to enable the PCIe EHCI device on PCIe bus.
> Besides, also add USB2AHP signal expressions into pin declarations.
>
> Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>

Patch applied!

Yours,
Linus Walleij
