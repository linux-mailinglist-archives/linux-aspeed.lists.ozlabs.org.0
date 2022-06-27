Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C855B8BD
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Jun 2022 10:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWhHz3f3cz3bwZ
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Jun 2022 18:50:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yjbLzOF5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yjbLzOF5;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWhHr1wCMz2xKh
	for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Jun 2022 18:49:58 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id r18so4066391edb.9
        for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Jun 2022 01:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=FP/GaPcBvGjggyyQ1dCEEdUzjPdfMITFn6wRnSlyWGg=;
        b=yjbLzOF5j+urN6XfJzvyPM94OzRtbJ+8bFayxKEE6RW2z5v6WIFQgMaz/BKF/+PGiX
         MQWIwRZh9zhvFB4Bvy8mwM2Fiw8cEH0O8PxPodp9w3Z+rAcO8C+163DcL57nJO0+D6gF
         9NfyKJ34gwqAvt9G944h4LBPedW6fLjvGONSuT1JGZXt+5wY340l1OGCF/gk8xsaD2Y7
         dtavos2IiyqFEL7qHS9C4OzA1kvPT7Lo3ICQy8XHVBUylKFt5vcOBpBe62Ns+ts+5bCc
         YIf30U9DAP/DIn5vdQG0pRCorA4Ghv80NGfhsKEEKlKuNwqH09aPAvpw0KF/f2fUNZsa
         iuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=FP/GaPcBvGjggyyQ1dCEEdUzjPdfMITFn6wRnSlyWGg=;
        b=uz1PEJlVCIfykefS3qAsvp5RkOAY3obDjHQix2uNlyYPI0rteJsk+0y39cuyibpqAV
         MI1gF18Mqfp7lCqqvHe/lW0uvzByOP+lg59gcR49YKs6n7p6U2VmaB5dthtj10/VBVcN
         iHNR8QKTfkrlsKz7Qz/dGYfDP0y/jyqGQYqnF1LZe8z77XChH0C1KOZj8jNApoZHLhCd
         5azvO3jMPuNuhaxiWBE+mcay3y71hnrhgsh8Qm+P8RSV9AjAvZp/6eOgQgGDXGVeWNkJ
         9kQNhfj2z9Z0bI3hzj2OX6pVwxkgwtHnlcRd0I3A7WOltBB0cTP3hN4fxlni/8yMYSp9
         Zw3g==
X-Gm-Message-State: AJIora+4pwDNpZfG7H8k0foyZpXgmJAhiDyr500QJjsdcN42d6OkoFpO
	hp+OBOpXf2KeA9A8cByGU7u7ZA==
X-Google-Smtp-Source: AGRyM1vWeJVmejaOPOyVJ0lfNvFasd3Lk5cx3A4395nD73h1yXyEWVIEMiYkIg8YEEoeEq8raaeW5A==
X-Received: by 2002:aa7:c881:0:b0:435:5dc4:5832 with SMTP id p1-20020aa7c881000000b004355dc45832mr15297321eds.265.1656319791931;
        Mon, 27 Jun 2022 01:49:51 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j12-20020a1709062a0c00b00722e1bca239sm4810194eje.204.2022.06.27.01.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:49:51 -0700 (PDT)
Message-ID: <5e0d5cca-c4a8-6651-0e67-47b5fc23c5c7@linaro.org>
Date: Mon, 27 Jun 2022 10:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 36/40] ARM: dts: aspeed: align gpio-key node names with
 dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, soc@kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 30 ++++++------
>  .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 48 +++++++++----------
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |  8 ++--
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 12 ++---
>  .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 22 ++++-----
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   | 23 ++++-----
>  arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts   | 20 ++++----
>  arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts   |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts    | 30 ++++++------
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   | 12 ++---
>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts   |  4 +-
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 16 +++----
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  4 +-
>  15 files changed, 118 insertions(+), 117 deletions(-)
> 

Joel,

Any comments on the Aspeed patches? Do you intend to take them or shall
I handle them with the rest?

Best regards,
Krzysztof
