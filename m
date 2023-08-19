Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68E7818B7
	for <lists+linux-aspeed@lfdr.de>; Sat, 19 Aug 2023 12:16:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r6QSLYT+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSZQS2J2yz30f9
	for <lists+linux-aspeed@lfdr.de>; Sat, 19 Aug 2023 20:16:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r6QSLYT+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSZQJ61Zvz2yhM
	for <linux-aspeed@lists.ozlabs.org>; Sat, 19 Aug 2023 20:16:06 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bfcf4c814so221457866b.0
        for <linux-aspeed@lists.ozlabs.org>; Sat, 19 Aug 2023 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692440159; x=1693044959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdIuirefSx1BPzTeUZTmUG2GheoNdWtbM86n1SoSEV0=;
        b=r6QSLYT+OQuj79GrZJTT9vJZwVwFWNyiYLS35jM8XQAzls4ZidjKqo3XE7B37q7xY0
         aVTpm5XiZpK/P/KDRZvqEGx1clFnesPMRQKHDKTE3zY9PY9B4nNMwZmaRLt56Seu6ab2
         26cs+1hrFHx4hAqTDnFClI9Udcg8Y9TVnwjxI2fiqZzI40/fO82fKeXFRfp74Rdp5B/g
         gXNPhLAXPDmeQbceL/lbhh0zcXqp8lrOkLalPT+CN/w94BUIX9Ccc/Q5ZRPmRoJQyh4s
         cG5Be6REVcucqZMHr7bBg44F6lmS9J+YUdo6mjyFr3CYTLC0J71p/n7T+OHcT7IO3eh5
         Ca0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692440159; x=1693044959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdIuirefSx1BPzTeUZTmUG2GheoNdWtbM86n1SoSEV0=;
        b=kvinXJuAjDtmmixz7793gB1/vGvRuwgNFtuUv9x/w2e/7CizCyfsYXt5oq3GhNnMut
         /jUihlfjV8ogKFqhOCcvFEbuFqUAdh463nAf/KENPg7dRjVOiUmyjnOTLVwMriqSNprx
         B8mTZTpnHz+7am30cliVtV/EqD+h7XA5+Op8miA07uw3l3NvbFKxh7PqeDkIEIOEgwtF
         sJmn61T23ubWfq231bkVmCejXU8wk0qWfcau0KnVFCVN9ML1ZZ0JBe1nO9iNi0zQoXfK
         t/cNFS4BdbDEuO1KS8YMDsnHYlOOKDP6VVpk7UB/EAfLusYO6+NEcpqPjbOja90B0Bao
         +3Qg==
X-Gm-Message-State: AOJu0YwwjVGJG3Bn4rfUuB0I+JFVrOxbut4YChSpJlFvg+SZQ14m5nwZ
	VFaFnibVqN5JFcboGfKC+u0MFg==
X-Google-Smtp-Source: AGHT+IGe8g81n1uQKahgkBJPCWcocD1AFWqZDAUIlbISlaV75NpgBM8WNKA8nPtS9Uqat3y/fgm7LQ==
X-Received: by 2002:a17:906:30c3:b0:99b:f3ef:f084 with SMTP id b3-20020a17090630c300b0099bf3eff084mr1178608ejb.66.1692440159140;
        Sat, 19 Aug 2023 03:15:59 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id a6-20020a170906368600b0099bc038eb2bsm2452762ejc.58.2023.08.19.03.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 03:15:58 -0700 (PDT)
Message-ID: <7ec61967-c899-4ebf-abde-3c1c5576d54f@linaro.org>
Date: Sat, 19 Aug 2023 12:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Allow only defined pin mux
 node properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
References: <20230819010907.916061-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230819010907.916061-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 19/08/2023 03:09, Rob Herring wrote:
> The Aspeed pinctrl bindings are missing an additionalProperties/
> unevaluatedProperties schemas on the child pin mux nodes which means any
> undefined properties are allowed. In addition, using
> 'additionalProperties' for child nodes with any name works better than a
> pattern matching everything with an if/then schema to select nodes only.
> 
> With 'additionalProperties' added, 'pins' and 'bias-disable'
> properties need to be added as they were not defined. A $ref to
> pinmux-node.yaml which defines the common property types was also
> missing.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Really 'pins' should have some constraints, but I don't know what the
> possible values are. Happy to add if someone can tell me what.
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

