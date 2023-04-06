Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CD6D908C
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Apr 2023 09:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsYH14Vmmz3f4h
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Apr 2023 17:37:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ohMvTjsz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ohMvTjsz;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsYGr4K2sz3fBH
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Apr 2023 17:36:51 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-947cd8b2de3so122480766b.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 06 Apr 2023 00:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680766600;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ijq1sQSgXRjCVw0Zbz7ioCZmIB2M5yer8Xo5BpM0JvQ=;
        b=ohMvTjszXNbfst0u8uh1G4YknBXKl6WA5DNnJ9KiD7zjy3IYj2/5nNpeu6C2Jcq7WF
         R8xOf8NOq0HB4VKrt6596DB7ZgLmU6+sHk9X2ZjKG2UoTd57j8RJpzFis2hgJA1SutAM
         yeXKSEuQl/dGFuWQHiy8RG+5Y4K7k9d9C1zU1QpZglQaqQVK7BjqFzprjKAj7gNAk321
         kUmlWovWOPZlhDt5nvllqNbz7oEnE8OCiDTwn2CkBtOLlPoGMAXby1ZWn2m0wOgA7FXo
         /GGLof4fm4EdSP/rm/yMYve6xjUh1l2GmxHq13fhSq/Y63Ws6Fo8FHLws1fIpKQMVx9Q
         yZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680766600;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ijq1sQSgXRjCVw0Zbz7ioCZmIB2M5yer8Xo5BpM0JvQ=;
        b=PYsm5mxwIbivLJ6yvzqTgQmDGMuxDX/7Ff13NzEVUPCnYOQG21cNJUdS7bK6ryxLYA
         7UMaOowKalQVE22s7pTRJ11DJ8X42Lkr5Qt8DW5smoYb2HWViypXQdZhrwEAqYtXhZV1
         0d9LF5LAsiD9te5fHyCTXX8lKlqxhA2kkqM0dpkDUJQO/96TQLdo3NEGILA9PvGaZTbL
         NaR72sGrU/SpEDj/aTw58s6RDmDiksrn0K/qYDFFU8C4WVlfMZydaN+92dZsJoMV0Skt
         vXM1UlxM9XDaaDkON1zSMHJ/sxKDfUYRdFwTZnR6jEVvy+9ENQKfu0b5cgJ1/v8cZUix
         sX9w==
X-Gm-Message-State: AAQBX9fIwBrjiU/oxkNUa8+xMPGJ8/pgQ20s592cYgFXb+T0CoOJ2bdA
	SRu8+qwM3azGJJS6evnGVCItJA==
X-Google-Smtp-Source: AKy350bk+DZPdYGsRNi+j77n2jK6BivgHWKBNISxMdpVatnWSqCJmwrkgIofxzZ998QwCxJ02zv4WA==
X-Received: by 2002:aa7:d78b:0:b0:500:2cac:332c with SMTP id s11-20020aa7d78b000000b005002cac332cmr3675247edq.25.1680766600157;
        Thu, 06 Apr 2023 00:36:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090671d100b0092973e209f2sm433340ejk.109.2023.04.06.00.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:36:39 -0700 (PDT)
Message-ID: <40f1ca77-7f7a-dc51-1137-45664a6ef2a1@linaro.org>
Date: Thu, 6 Apr 2023 09:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>, linux-aspeed@lists.ozlabs.org
References: <20230405022825.333246-1-ryan_chen@aspeedtech.com>
 <20230405022825.333246-2-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230405022825.333246-2-ryan_chen@aspeedtech.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 05/04/2023 04:28, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 52 +++++++++++++++++--

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

