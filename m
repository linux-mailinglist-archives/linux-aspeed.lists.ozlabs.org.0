Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C927850EB
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 08:56:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IClLffrp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVxnv0Yx6z3c2J
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 16:56:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IClLffrp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVxnj4xBNz2yD4
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Aug 2023 16:56:07 +1000 (AEST)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-48d11d1a251so1102932e0c.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Aug 2023 23:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692773761; x=1693378561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB8ZbVq5sQ7DzHOBHLugPDAWi9TKXlIcXjvdJWhqI+A=;
        b=IClLffrpZcMu+6LKkWMb2iYMjsTjrkaUqrYA7WVBTBrZu8Rk9cEmTcQpNzwliaEYOs
         Fh9iUcv2UOIcNrn97Bt9kXa9oRjEbVR0W3uxBGa2NbMYqsgayR3isNmKww9L5bY2Y7HI
         RatRDyLvwjy/V+In9dVfKaPi6OaFcpK+NDakk0Nv89OnO9fYh5YklBNNKQABownwxaLy
         Vc/ih1L6v1WPG18V+1O9nhhKRxifefgFowtPdN/aKz/n20BVZNJSUY38+FJAGH0gEmZp
         idlDOcjuIoF4kaalYRzuLi6zFQOZYQjBzp9E75g8QeWRgjkGt3ZOSHq/LO3lLUIy5rai
         33EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692773761; x=1693378561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lB8ZbVq5sQ7DzHOBHLugPDAWi9TKXlIcXjvdJWhqI+A=;
        b=huEVCQNjdPsRiSZwd/ui4l9sS07wBfK2GwjqnD2+VuT7PGcfyL0rkGyQLqnKQoIyjj
         DBmGbxfMNPQfpRRBYPRUk7igfucdAIjVpohetqo15pSmuvYWPamtLoclhjM1My2GJOgc
         J2C35/Fy2WcYEJ6GtpSte3zLDmmvrEtsNxgFn7L0eloQ5zLkKtnn2QywERE5hj4/Wp6W
         McUwZ9l+WmRFuRXOBRnrQR5PGxvpU7QGpR40cF2POGhtM66nXVHlZKOJ8hlkURgdFD9J
         idvW8eoYVykcJ7nRECn3EzjLrpJdjW3sjG5gDjiQXgH3wt21NxI2lDhoLNlpeqYENnus
         kQdA==
X-Gm-Message-State: AOJu0YyZ5lkXgovOyPfl2cOTH5ueVby9spoQErH/qBO5hPKlUfpy2QVx
	QRBjXWPa7qon3VDh9XJbXel09Kj8+M1IOsqaYz7NTw==
X-Google-Smtp-Source: AGHT+IEwjcDx1d3S7SNyrAkvaRo8eUvQkQP4M2xlywseolmmO9jwKjqIKIoGVYIjaFiR0hfjVai9PSjnU42jN3gPoW4=
X-Received: by 2002:a1f:e2c2:0:b0:48d:13e5:1376 with SMTP id
 z185-20020a1fe2c2000000b0048d13e51376mr7597851vkg.10.1692773760791; Tue, 22
 Aug 2023 23:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230822131237.1022815-1-lizetao1@huawei.com> <20230822131237.1022815-25-lizetao1@huawei.com>
In-Reply-To: <20230822131237.1022815-25-lizetao1@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Aug 2023 08:55:49 +0200
Message-ID: <CACRpkdY1Q0U6Yh69hW6FYJbDf7a94=UnwinuKaUnz6aqOaWaLA@mail.gmail.com>
Subject: Re: [PATCH -next 24/25] spi: spl022: Use helper function devm_clk_get_enabled()
To: Li Zetao <lizetao1@huawei.com>
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, linux-rockchip@lists.infradead.org, khilman@baylibre.com, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, daire.mcnamara@microchip.com, venture@google.com, heiko@sntech.de, fancer.lancer@gmail.com, linux-spi@vger.kernel.org, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 22, 2023 at 3:13=E2=80=AFPM Li Zetao <lizetao1@huawei.com> wrot=
e:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepare=
d
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it i=
s
> no longer necessary to unprepare and disable the clocks explicitly.
> Moreover, the label "err_no_clk_en" is no used, drop it for clean code.
>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
