Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6F98BF96
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 16:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ0R75FDXz2yNt
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 00:18:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727792304;
	cv=none; b=cmMhTbYcLdtJYztxJZ1f3nfij4/nypgMfHWJSZFQX4dCujqB7ebO84iBxAMLVj8dK4bsoBjKEKkZGb67uqS+Wn6RQ3o+KTxynyIwzm/neCR41T+8FBv4c/A6YCwtRrGNqyrHqPxwzKJsF61vrKTHuMNNdVqRsl6eZCzGZJT4MA/Kal+i/7DGsgE+WjcK+pHiIo4ikcfJLuYB5/gpcSTYXjjocw6GVLLGnaxnH7wsx+AJZxFSFySvZcfPnKt8s8IDqLJzVqYnPTdoJPbsrq8bRT6p9zKn4nxeqqBFCoyFBGOoBJsYC2UiXRkOuquDiD64GOq2wVHjsx0uWF05biyCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727792304; c=relaxed/relaxed;
	bh=XsFwKLOGlPvFEBxHyR86cL5eojW2dIOejDjQT5SGeFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcGjS+rLBmUqH08HrHEVvRJy0lidBDJd6OAr+8sIZyI5fNIKcyc5WCb608szpsd3GJYzLqZZpgovQ9S+0kbBOfJeKSV222NVOKuaD/BP+zts89QIzXaMOZGE/WGcuz7yRLRPyUqy41jG48L4ZiUfaq+upTYqxcR5d01ny1nfgaKtk9hq6chx+vH9lp7nNE3aAUoQXopK2VvNJ1qHQ20eRVQ6MOrNRZ5U2ZQ+ktvOJBpzJcSDLouLYV9vqPSZX9qdb/d89ERPApWYFDlq7IQWFvXZrXCev315AKbjtoh7xgnS53zBbvOumQs/DEfxPrXCCFJbHZiZSsPreSdPUXl1TQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SUQT6o7T; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SUQT6o7T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ0R31hCPz2xBK
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 00:18:21 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539983beb19so2379743e87.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Oct 2024 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792296; x=1728397096; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsFwKLOGlPvFEBxHyR86cL5eojW2dIOejDjQT5SGeFI=;
        b=SUQT6o7TDrT5P8OupR51YeW4+s0FArOfVcOo6csXA2p/pV8XC7yV6vlqBAZsXxYsfa
         KBbOgnaDt2byJrESwcz3gltYKL8PNmGvCEpGaFL7YXY4wat0Qfa/OlvyKuRv08kHrbrt
         JSRzAZncanyQECGVEL+XENGbyjtzt4EpbLqYMN1Fovu3O2WHPG0eRusi+p2qkk+lvowL
         FCuhckMYg775ARXlh3p+aluzSshMPvQV6rw9lzAP7nWvCl0uomYC4luxvY90z5oyzuX1
         5nUXJKcWJ8NQAyykdFaXGhSfa/JLJsAmT/MCPcRc0edQQJjhXQD40+FgdTbh1cY7JasG
         ooOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792296; x=1728397096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsFwKLOGlPvFEBxHyR86cL5eojW2dIOejDjQT5SGeFI=;
        b=EGwT8fpCD9XMt1EgfjoqXYp0LwSOHTWA9aA3cGadEcpQDuGKXZiqKy6W/x5SbUl1l2
         QDIweDJDK4NbkH+qDNP43KWNlvl8oN5l/GLnIk6OSxpY5YyaLAg/GwKlHbWgEGJ+eFcv
         cAqWeczLQI50A3QKxe3OAMpXhysa0VfjA6gFrdoquPQpy4Cf6hMtsScsqHyTHl94O7iX
         QMw4hEgDCuUMV3cdf0b9mcWhVn7E16+wAESQRscoFijfVWGoW8J0wF1W8XFuhu8WQuWO
         WIJnlaceJfOBkbgAlrXSWKXCrzp+DmzVGH5EX4aNjdppxNYWzeqtWTCmNQdJZRnYWjZ6
         WdBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXstzhIY++UaLiMb0Z46sT3lHKIbPmX+7KlTSzz0nQmw8Patl5iInfCrx6J2Q1EymP+q25hQrQsAatyCAw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnfobzEc0uAT3GCUcSz2NsvvOyF8iWv/sCwnusRc2ZYlmPyG1p
	Rt4aHU2o9c9SfOu526f/BbYBNP0iaBfzCZ2keo+CyHts3Oi9P4bolVZV55V45c68A96kGeSUKsj
	8LzvYwgxaoZ1KETK+S2hMrqYDfQ+ICaxONx6O9A==
X-Google-Smtp-Source: AGHT+IEfMH8uk4RIxkOdO5Hy2blq4o4vWNOnpucH3GZ2DnMbaYnX3CqykKYsypLP7wl0QcmQrA0dM4xIL26aFEV1xAs=
X-Received: by 2002:a05:6512:1155:b0:536:568f:c5ed with SMTP id
 2adb3069b0e04-5389fc32b18mr7413043e87.1.1727792295331; Tue, 01 Oct 2024
 07:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com> <20240919094339.2407641-7-billy_tsai@aspeedtech.com>
In-Reply-To: <20240919094339.2407641-7-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 16:18:04 +0200
Message-ID: <CACRpkdbFD9CiqVwQ5xxZ9SfQtVvDJGCr=8spxBG4u-JQ0PKJ3w@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
To: Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Peter.Yin@quantatw.com, brgl@bgdev.pl, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Jay_Zhang@wiwynn.com, BMC-SW@aspeedtech.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Sep 19, 2024 at 11:43=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> Performing a dummy read ensures that the register write operation is full=
y
> completed, mitigating any potential bus delays that could otherwise impac=
t
> the frequency of bitbang usage. E.g., if the JTAG application uses GPIO t=
o
> control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
> sets the TCK clock to 1 MHz, the GPIO=E2=80=99s high/low transitions will=
 rely on
> a delay function to ensure the clock frequency does not exceed 1 MHz.
> However, this can lead to rapid toggling of the GPIO because the write
> operation is POSTed and does not wait for a bus acknowledgment.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

If this applies cleanly on mainline I think it should go into fixes as-is.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
