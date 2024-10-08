Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA19950FD
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 16:05:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNHph2B7hz3bfB
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 01:05:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728396315;
	cv=none; b=JjqUA0W+dPJ+uI7mUf160E9bhgxaiSm/KgGOtg7CT0B6/yz8B4th8+86ISFPtuYKAfe718QkAoooLeTLdopjVlGT7cOK8vA018U6OGP3U/Gr7KjehLyminN8MQMf68ARmkFx4wi14JE+d5K8L8Is/uTRcgPTwHWrCGw/M3giOGsefmblPmVPPSVWCqCxl41UFTlE/z7FIW9swXup2YRR3Gr6sWMNnhByafpm1DvoyqT9gRydnJ3X+Kxbe4vApAlHiHPBv0rMf9f2yADbjJserm3YlmH7GOFQl1xm/jXn1TZRAQhX0eEUJo51A/33Ykij+lrhfD6zJO4xlwVcTn3CTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728396315; c=relaxed/relaxed;
	bh=F/zAtiWZQI7SQwrRf3j8mFudmNdtJgba/frtTc8eoX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0hzihX4jGgcGeZOsQQ0YgHj8pt+FJjvG0yst07kTePjag33VUyOEjFd4F19G4KzdeZmwC4hanDpLtLhy9J99dmc95i7L7IgPMNUj/Q2PpgRbcX7NgmTZl6vOjuPP5Kq+GZVR1BvUxOfffvX5dHMqPN05tvfw9Ws7eE4IKvcdBB70FRZcdtqPlmBhhxnX+vqkCPck9aTz81XQykSyR6hpeMTMkG0HUy6l6tprvJx/UGEatx8pFOLPIXq3ddjDMY9AYzmtsVGzlKbzK1gW+aetS3ky45JAwkJtBDk3pDgaWHWwR8tMeQKusIKLRFkWT2+6dqx+L3TYXTjsihjvRdGGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=FFB1Y42G; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=FFB1Y42G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNHpf48NBz2xy0
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 01:05:14 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so6945819e87.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2024 07:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728396311; x=1729001111; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/zAtiWZQI7SQwrRf3j8mFudmNdtJgba/frtTc8eoX8=;
        b=FFB1Y42GiwxfAbTzZ6RoP26/txS5RQkHsLUNlnkWpqran8xl/WtthdUAStcfmgqI9E
         Pqd/aU0FgYPzJ2IeXt9AVslFJ5ODgJ3gOWpjC3gGeuT72pq3uu/dsFxYSxwEnK+fkOzA
         gRJWmRHxKJARncDlEwgJiPA45uNXuLfM+lgrQhTNtk43m2YJzgJlTjaq/vA7lc6rBp4f
         OBqAy4x2HJbQTBvy+mNvyGpKev6eCtBCvbhWiJ6EGTMMqDigiBL0bOnjZxionw/mS2yA
         NqnlPWmnMmmOiqQMmbfWY0RMtusP8qzZXLHr45vg3HOanh1qM3w4071a8hmClHoE+mj8
         yrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396311; x=1729001111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/zAtiWZQI7SQwrRf3j8mFudmNdtJgba/frtTc8eoX8=;
        b=Lqx9/WD5toaZU8Yo26eFOYOpS7N6INa4/5mi/d53Cs4p8wDczInv+SwBXFO7qtFqb4
         vmUWpkacoWTQL8dUewKgWAhVgdtgUK9KpgUvVkpXgBPWLU98cN7jf9cvzKVu+iE70tZv
         MVczULB+QrjrtN3Allap8/0sa7Q4YWwtcPmNmKsesJ0hqOtVYzGqiG1pEU07VankMXRo
         hxg5yBiEw8JNKt3KYdtoFig3A0zG6/bC5O+8CkM78X29rlSt9bFFdgXVE625rkZJpwAP
         +rCHn+xzTnKJZfGXpTXdHJFRJc3FGPE6MwLFfJdg3qSBmmrAA+EuSNRYaUSxyTFwc143
         pn1w==
X-Forwarded-Encrypted: i=1; AJvYcCUFdINTohxaFyOylnFmf4DntT795jdbzycp4c2Gy1VmsNdjIPkauxd+kcIEu5i0YV+ZxrvR77PSCSiwrOM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyTBzG7ScCajXkIVhn0vLD16F7u8vBF3yPXBboWt8lCkN86cQ+m
	+os8DaxJWqoM1kThNx7KxbB0F91gRQO/ANwWC5xHdMnKxuutXaFC6S/pcFmTLCm2J4WCWrDtEsH
	rhNr7qhfOvhQY/n7BVbH1kzSyC47yLddsnkdU8w==
X-Google-Smtp-Source: AGHT+IH1k+VS7+QOkdRfKiZ/ppDlZVYCrXPrQ0PrBFHAOvGlq7s9Ltc5V63YkuZv1c4KqrPzzDwk1k5PEzavj/a9qU8=
X-Received: by 2002:a05:6512:12d3:b0:535:69ee:9717 with SMTP id
 2adb3069b0e04-539ab84a7cfmr8460693e87.3.1728396310565; Tue, 08 Oct 2024
 07:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 16:04:59 +0200
Message-ID: <CAMRc=Md4BOsdv=w+ju00X_R1Z_RAXz2vidVMrb7riaE2HoS9kw@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Add Aspeed G7 gpio support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Peter.Yin@quantatw.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Jay_Zhang@wiwynn.com, BMC-SW@aspeedtech.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 8, 2024 at 10:14=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:
>
> The Aspeed 7th generation SoC features two GPIO controllers: one with 12
> GPIO pins and another with 216 GPIO pins. The main difference from the
> previous generation is that the control logic has been updated to support
> per-pin control, allowing each pin to have its own 32-bit register for
> configuring value, direction, interrupt type, and more.
> This patch serial also add low-level operations (llops) to abstract the
> register access for GPIO registers and the coprocessor request/release in
> gpio-aspeed.c making it easier to extend the driver to support different
> hardware register layouts.
>

I picked up the first two patches for v6.12. The rest conflicts with
my v6.13 branch so I'll send the fixes to Torvalds, wait for rc3 and
then apply the rest.

Thanks,
Bart
