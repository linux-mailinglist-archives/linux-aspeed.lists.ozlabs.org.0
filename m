Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F0559BE44
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Aug 2022 13:13:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MB8qy22FKz3c3m
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Aug 2022 21:13:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a4mx+uPT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a4mx+uPT;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MB8qt0RNGz3bq5
	for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Aug 2022 21:13:43 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id u15so11751176ejt.6
        for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Aug 2022 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Dkr4AIdROVLhVEc8a8eBTTU4GUL6aPXhNeYUI6btP8k=;
        b=a4mx+uPTAWxThPbOx/cCMZrRSh16NAD6vD1VWyo9tAkX4CFftSHGfFqXhWn3EKf+yz
         ugQ5GKRmLBpS/Dmb+C/ZgDvRXhAbybnX4F39JVIx9dNQlI6hTavItP54r6u+NmZgqpIe
         Pt7esidde8LIRS9wlBGVeBAURqHNMHzvCE6FZr3I5MxOa8RFF2OqKPx8ZCB6WN7U0uOq
         1am0XnDm4/m5FjHZeQIK3Hjsi0p9bVZy5bQsJg6c7SnodmCxLHihqzXJ7jlpd773Psoy
         Uu74Ni7Trm66hxyRAJoQG9B3+OBsY67MG98xJaBSoa+Xpm5IAOwpyufoF9T78nxmGOQG
         DX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Dkr4AIdROVLhVEc8a8eBTTU4GUL6aPXhNeYUI6btP8k=;
        b=oA6qcuk8i6ylNpUwXhh7VujzMoq/VCvk42QXV3T+ByalAyIPVWgZdcIEDTAB9DTBeJ
         dIDLx3Aw5bTXJei6k+GSnqnb4ZD9r6TH8wmKXhkpFg6V2wN81oKzgGgyt3IXujmtMSEZ
         +OzvdR6F+z+ZIKHDjtq+5/Lkxx/5W/DpcbxuirY6b15dmqqOvo5ISxyn8IIXhH3sruqK
         E0EVkDXgX59hdzjBxZfVFFGwmegLOrz+Jy61cQzJ6DIJyw4v5cPzYzv6SZue4HDpgOyo
         xtn6q4PD7ob2nM1fczd01VUIWpbMnOX/28WrKb2PZdybONug4NbNhbkbegP/CSe2gmx3
         6K5w==
X-Gm-Message-State: ACgBeo18ACiODdSvgrKQi1CsYjRNOOovY9hXtwu/MthOLcjUa4XpPTwN
	1JfeaEyvyCzeflzBy99hJOuQLMlF88JFv0Q2wq8Qzw==
X-Google-Smtp-Source: AA6agR7B52ymIWTAoSTjGWlrpKupo1q6W4BPMdfiAdfh17RVskPjHkwynKSg6KMu7i21JPyuYlJkFkRU3PYZihCXEOI=
X-Received: by 2002:a17:907:9628:b0:731:1e3:b168 with SMTP id
 gb40-20020a170907962800b0073101e3b168mr12744420ejc.526.1661166817013; Mon, 22
 Aug 2022 04:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220810161635.73936-1-robh@kernel.org> <20220810161635.73936-2-robh@kernel.org>
In-Reply-To: <20220810161635.73936-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Aug 2022 13:13:25 +0200
Message-ID: <CACRpkdagwr91UuwC80thn5t7KpcBek1gitTHPHvUy1ntP7FQrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: aspeed: Add missing properties
 to examples
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 10, 2022 at 6:16 PM Rob Herring <robh@kernel.org> wrote:

> The aspeed pinctrl parent node (SCU) in the examples is missing various
> properties. Add the properties in preparation for the SCU schema.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

I see Lee applied 2/2 to the MFD tree so I applied this to the pinctrl
tree.

Yours,
Linus Walleij
