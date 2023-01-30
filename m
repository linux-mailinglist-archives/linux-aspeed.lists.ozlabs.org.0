Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34A681E71
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 23:52:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Nk81hkrz2yxQ
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Jan 2023 09:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wAmYUNti;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wAmYUNti;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5Nk3137wz2xkm
	for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Jan 2023 09:52:42 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id x4so16036656ybp.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Jan 2023 14:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P52iw2KdpV97bLV6oGgF0ttgr5Mknb31FWdz4/VnAEw=;
        b=wAmYUNtiCGghhXnjzHicWJYhy1R7W6aAJBOckY5LrPTf6O/V78NoSo01oVmnAkHTSc
         mDhIf0fdlqb5/7kZMg53z+j2SSbXqVtsbHpqWQ9pwWH9Vb0lTg27LR4XzsBgL7e62rzL
         PYpykaSb+gDhwj2FEbIgkLXkDwjIiU2sJGHOshVrdTKEVl8qqM1WDSZHvqyJ7l7JKjJ0
         la7xjJKhJFRiLU07iX5kZo8ARoYskZnaUUJKb6HhkQ9WlEB9NTk53mNwVtlp36yQ1uR1
         VuYSCvAIIIeBZfB/59DA4YiW+htZrwapaWB4PNtowr8BmM4hUbxxpuKCdnLkKnCYuot1
         tJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P52iw2KdpV97bLV6oGgF0ttgr5Mknb31FWdz4/VnAEw=;
        b=KztvVUIrS5TaiT8iMdQ86W1A3FSV45gRo/YRNZnT2X9SMMgr5ny7pRO0NQrwTjwIDZ
         /5yY2eyqCU8fvk7N2II0grF41Eoj6tfiJohb+6J3hqsrCQUhW+4HHQeBhbL/e1fr4EgC
         JyXHYCjSZDwi7xytOjR3Zzt1YHw2NjKvWS0J0/6SAJrjuz0hrkQXLmQfMlS5yyY+7ATL
         /4nHkHjcXxGrcgysD0k0P9m/KF7PNC8uDf46Z4hxRgK8JEEI1+RovOavy5e24Q7lP+tD
         ci0tWN8kgBqQAnNf8361CKjcJJ+946XixAaK/7IOhSJHkcOxY8P3m1dXAtCbjd+MVZ0q
         uGUQ==
X-Gm-Message-State: AO0yUKVAZTLMEHxDBh7KEsOmU5GNC7fjutnHsnoe71UCqeY06xZ4IT33
	J6MLqDto6DAouLThWtJ10hbXfkK1Dkd+7dH7D88lDw==
X-Google-Smtp-Source: AK7set++WO/96HugCAeMpHgFK+5pdRRPxKJ4VYtuRaf0p5ytvK3t3J/o3mwrh1deUOuIXSDy/KdLquretR8/YkzFjHs=
X-Received: by 2002:a5b:c1:0:b0:80b:c9d0:c676 with SMTP id d1-20020a5b00c1000000b0080bc9d0c676mr2187864ybp.341.1675119158843;
 Mon, 30 Jan 2023 14:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20230130220845.917985-1-joel@jms.id.au>
In-Reply-To: <20230130220845.917985-1-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Jan 2023 23:52:27 +0100
Message-ID: <CACRpkdY3VtkJZn4pHawFiW7yie+BWvT8o9Qx0Ym0ihgi3ACJ2A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Revert "Force to disable the function's signal"
To: Joel Stanley <joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jan 30, 2023 at 11:09 PM Joel Stanley <joel@jms.id.au> wrote:

> This reverts commit cf517fef601b9dde151f0afc27164d13bf1fd907.
>
> The commit cf517fef601b ("pinctrl: aspeed: Force to disable the
> function's signal") exposed a problem with fetching the regmap for
> reading the GFX register.
>
> The Romulus machine the device tree contains a gpio hog for GPIO S7.
> With the patch applied:
>
>   Muxing pin 151 for GPIO
>   Disabling signal VPOB9 for VPO
>   aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
>   aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151
>
> The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
> of_clock code returns an error as it doesn't have a valid struct clk_hw
> pointer. The regmap call happens because pinmux wants to check the GFX
> node (IP block 1) to query bits there.
>
> For reference, before the offending patch:
>
>   Muxing pin 151 for GPIO
>   Disabling signal VPOB9 for VPO
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Disabling signal VPOB9 for VPOOFF1
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Disabling signal VPOB9 for VPOOFF2
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Enabling signal GPIOS7 for GPIOS7
>   Muxed pin 151 as GPIOS7
>   gpio-943 (seq_cont): hogged as output/low
>
> We can't skip the clock check to allow pinmux to proceed, because the
> write to disable VPOB9 will try to set a bit in the GFX register space
> which will not stick when the IP is in reset. However, we do not want to
> enable the IP just so pinmux can do a disable-enable dance for the pin.
>
> For now, revert the offending patch while a correct solution is found.
>
> Fixes: cf517fef601b ("pinctrl: aspeed: Force to disable the function's signal")
> Link: https://github.com/openbmc/linux/issues/218
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied for fixes, sorry for not getting around to reverting it
myself, but the commit message got really nice in the meantime :)

Yours,
Linus Walleij
