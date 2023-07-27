Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE4764734
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jul 2023 08:49:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YxC4YDI+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBLw95qNKz3cCl
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jul 2023 16:49:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YxC4YDI+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBLw24YMFz2yVb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jul 2023 16:49:04 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bcc0adab4so75486066b.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jul 2023 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690440539; x=1691045339;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3X8Zj4OP70OiqAhYnmxGDR9inGCFFjwz8hO6iVPB9c=;
        b=YxC4YDI+Y31qmYG5osPjgudcxDzKIfFIlK0DZRrp54Peo8y6rVsb+LWS6tpf+eS7fl
         +oHJ/p/utFkIJoczkcJGZamK4aPLUBbro0OL9Zuy7jzrwDP7H6aKS++4R/QthKJ1qdfe
         u9y5TYVvaUhSSQemkMPlI/hOFEgd5m+4IVpSRi3hT62sTkk+Vqsg1PDUTZIhmDl03xvB
         3dS65AdFrL1d1XQCw2xHSrr1t1Pb7vAF4rfyqFmADmCgDp5Sg07OkIOkqDm32HWcef4l
         Xtxwk1LRDZSwFzm2z5UCYL2Ft7+cr5drXXjBR7XasFYirwjLzor+Jke8ABRsSUjwcFfm
         LkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690440539; x=1691045339;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3X8Zj4OP70OiqAhYnmxGDR9inGCFFjwz8hO6iVPB9c=;
        b=emaLH+uHcGageLs1tAhpAEBVGF/GHBOqAKV4FMrhONYLblLccpBzwpII5rvFwS0Clx
         j7pZ+jQyLcxtjabTat4xF+hTq+1eBCZ/D3WWn/hpcRAlNov3zyK2a07khH8PnqANFJmx
         j6FywTkw6zqiHwnxt55pyhtii7UfFyzwJbJYGXrTZZ3RMfQJ9iKnciM8m/OoLzSBpQXE
         e4CQrc4XmimWZERtuyGI2SMZsgPIr2H8Y/xI62oSceUxUWGHv35N2Et9eWsWZDFiffzr
         ZXEWQ9w5Sqjvwbs8SjrOm7YMyMr8F+vafvpLGylQzt2KPIA8xASuMOES50kv3w6wWey5
         YxRw==
X-Gm-Message-State: ABy/qLYGI1PqACK78oERwfyOA+74qIdxZda9P+PW1XW8dyyMTIq0IG28
	6k9v9Z2too/Dl4xs3UomsbTI9Q==
X-Google-Smtp-Source: APBJJlF7LoqmSv1+Kkydpo8uSWljyUepJpwxz2Cw713ZEV3Gf/tzcJlwLjDc1tJeLlS6Qd/HmUEQpA==
X-Received: by 2002:a17:906:5385:b0:992:a0c7:8d2a with SMTP id g5-20020a170906538500b00992a0c78d2amr976108ejo.54.1690440539233;
        Wed, 26 Jul 2023 23:48:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709067e0600b0099315454e76sm375402ejr.211.2023.07.26.23.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 23:48:58 -0700 (PDT)
Message-ID: <c9062d5c-b536-f89c-b380-8a0c9b858526@linaro.org>
Date: Thu, 27 Jul 2023 08:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230727033926.1904529-1-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727033926.1904529-1-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 27/07/2023 05:39, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Yosemite V4.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)

I got the same patch four times...

Best regards,
Krzysztof

