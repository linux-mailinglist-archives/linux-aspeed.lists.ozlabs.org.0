Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395277392D
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 10:53:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MUd3e01I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKn6T0jTFz2y1c
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 18:53:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MUd3e01I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKn6N5jLXz2xgv
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Aug 2023 18:53:48 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c1c66876aso749765866b.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Aug 2023 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691484826; x=1692089626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iq0fuWZwZqbSchZWggB1/iaIkWHEYwpCz6Ex4V1jQs4=;
        b=MUd3e01IvKJqEl77RvQP4W0zjDayhKvQNOijiT0lL0ebKG2De2+IpSt7Ty78e0rYv8
         DfiJxyrsYIi7j7pcnn/0mOQdCqgRgXvzFRHjZiUZvm2us96KpVQjv9TxmjBEz236ni5w
         aFNReZWvRqdofwvhdqVPRCDCAC3wMHstAlYwtzv1DcuH63PE32oj645/7RZQpc1RLl5O
         aVzDmEsoJ1QLXK72st8QTGegwXVY5MSJKwkOcQY5Mq/wEN4opzuEAqzq9mGUOUbebJQj
         Z8DwUpC/C9kBSGRWzjYcOlz7G485y+WrrUSk321bkMWX5bEWlnitp95qq8PX1JeKFX+O
         cAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691484826; x=1692089626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iq0fuWZwZqbSchZWggB1/iaIkWHEYwpCz6Ex4V1jQs4=;
        b=TpuWXiAM0zy4ysxJYvTbtnxCtfTK+IGPjrLo6XRaiPuELEtJPOoYJqSmHgzKZWyzz+
         nbMPx/zFdvU9t83Do5BWBremRY/pPjWyTV3FI0vxpbwRrZKGAdF2YWWdG4huJgqAgPbt
         eBsX00PHqoO4NGys4+PUuIvIqv8I+Mta/FO0t59qtYHAiKpfzsqtaJa9AOTM6o2dcF+C
         qqIsdl63XRJP06TA8mB1PBdzcHDXt37g9/il8UQDYts5yqcc9AuGh7wYZnFqWP9m/3bx
         8jcKGC/C/llpdpRvXZnRW5OQGEWkD0Vgf18DAbcTPl7XvwSFjpbNhIkFWyzRr9NOFFV7
         DBIw==
X-Gm-Message-State: AOJu0YypBB9uVPgey3Y6O4H0mZOzHjbQ8G0KXm34+0BTaxPab3yJ1ldN
	zGz4u4SI1xu6S92fxyKCteN7mw==
X-Google-Smtp-Source: AGHT+IFqJWNgx4SDpHJVEfxD9C+abszRRx1REVJ80Xsoki5bg1/ZLXXf6uPqaSk3im75Pf+vcP0AAA==
X-Received: by 2002:a17:906:74cd:b0:993:f90b:e549 with SMTP id z13-20020a17090674cd00b00993f90be549mr11013614ejl.37.1691484825944;
        Tue, 08 Aug 2023 01:53:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906168500b00999bb1e01dfsm6303027ejd.52.2023.08.08.01.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 01:53:45 -0700 (PDT)
Message-ID: <56593261-6e7d-9694-91d0-dfbac24aefa3@linaro.org>
Date: Tue, 8 Aug 2023 10:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: yosemitev4: add Facebook
 Yosemite 4 BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230808084248.1415678-1-Delphine_CC_Chiu@wiwynn.com>
 <20230808084248.1415678-3-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808084248.1415678-3-Delphine_CC_Chiu@wiwynn.com>
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

On 08/08/2023 10:42, Delphine CC Chiu wrote:
> Add linux device tree entry related to
> Yosemite 4 specific devices connected to BMC SoC.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

