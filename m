Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7755C0F5
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Jun 2022 14:31:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXP8P52pzz3c8Z
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Jun 2022 22:31:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GgR5U+cp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GgR5U+cp;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXP8H2Kl7z3bsW
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Jun 2022 22:30:52 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id x184so19192293ybg.12
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Jun 2022 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eBKXak+Ob3Ei97kT4QVvvk8BCgAkzxz//k5i3YHr7AQ=;
        b=GgR5U+cpKuP+beC5qwn6CiR0EOEH6XzBLb0i+6n7DhIVMPsRTVguBuX0GIFAwxtHyh
         VOlzkQLFjsTz54u8QZEbUukqSXXjKYLOVIBuqZ3j1btODAdIlrA9u1a5VdWDSsmZEmmt
         8HzOgNn9XwKr39VlXaWUXbCXnfhLuQ2pIouO3gSqelhRlHTaBJG2ZJb+VzuU0TyMB2Xy
         Z/MBdiVRKz/qu7DF8dDxgw2opyLIs9KHEig8sEDnhzt37j5kzjlQHYZtOorhWUzsHAah
         HzUDVeCnzEqccpNVKFVujHPC/JsZe9FKezhZa5GXwVtxF+kOJpeAyebhqmWlELdqmzu6
         wGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eBKXak+Ob3Ei97kT4QVvvk8BCgAkzxz//k5i3YHr7AQ=;
        b=TquNfxGN7Hfa5hZwwPcxCwYeCckBLSO/ovnaKuikFAK8SfQWPsQyi+3RTDjidaJKXm
         sG1nFS2RGR80m9uR71JvDXwll9PuklX2D9x6EtpYfMt60qIYprb9f1OOTfLW5nEeeb3U
         CV6xfj1Co+fbuZSa9LTwJIrVnOAdC0p0OB6BbWhXnhFB6P4WC3XYs4jyqWdt/n6LaSq0
         q0L63562jFKV69UnIqVHzEs5Awa/lKBYbEO3Ni+dDVLIxbBWvOfLJ6e3aQJQeAruoN4A
         luDMZTTCNMYeASposukVgDEu/hQkVX2OwY+37MtGOvQjH4eZVmfLfAoXY+kRAM+HTRL3
         CJdg==
X-Gm-Message-State: AJIora/6JnVId8/acEehJZ+AVPqfHdyC2H9V+JzmNj8IP45OZcPjsczC
	NBVWDbjitghXc09X9FzoANPsmj0hqlL6RYnwk3S7sw==
X-Google-Smtp-Source: AGRyM1uqJ5PwmFL/fd47hWxyC8kjLJIIiZ/wXBwR5XK7rYnGkAQfZxlfGFpBUXdqrwfZF2uAIE39CgbX1jpXs0bF+JY=
X-Received: by 2002:a25:d88d:0:b0:66c:999d:919c with SMTP id
 p135-20020a25d88d000000b0066c999d919cmr16080159ybg.514.1656419449622; Tue, 28
 Jun 2022 05:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220618130854.12321-1-wangxiang@cdjrlc.com>
In-Reply-To: <20220618130854.12321-1-wangxiang@cdjrlc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jun 2022 14:30:38 +0200
Message-ID: <CACRpkdYqNNAN=-=zfNo4FCVZhQuNju=fGA8ykSQdndd8NfQ86g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix typo in comment
To: Xiang wangx <wangxiang@cdjrlc.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Jun 18, 2022 at 3:09 PM Xiang wangx <wangxiang@cdjrlc.com> wrote:

> Delete the redundant word 'and'.
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

Patch applied.

Yours,
Linus Walleij
