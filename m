Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA436C591A
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Mar 2023 22:55:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Phj1t2tN2z3chm
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 08:54:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e3uHRIoB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e3uHRIoB;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Phj1l5l1yz3bmH
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Mar 2023 08:54:48 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id ek18so78835133edb.6
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Mar 2023 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679522082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8uvaRG6SEubgVDA8byacGya26N57UadVLJD7KEjV3v8=;
        b=e3uHRIoBfiqATEEQUeoKbGF4jKPKe/GadoIicmI2t0auPCUZSg0mWBf2LIk1arnKmZ
         54hOhTTuBT3JmwEEZob6Lw4YvkMmj/kplRUumQm3fHT7Kd4AxBPfk8L3b3XpmeoWGLPg
         T+2whG2hq/Sb8mClxgwgOT+kPi0v3gbBeGTzI2wp7+YS7q3jtsp+RoYUX8bTYdNySWli
         vQK1fv45TOVgSllyKbw/6jDxPXyacVEZGCQsZk+1yl+khoX7XIbFqL7Z2InRpfvPxXhf
         DiyCR8yjhJ0oOjhFBdCquaJhzSEkQwCNf/9P9xtscbbtt5SRkzF7Ttvc/WwuPlTcXR4Z
         KW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uvaRG6SEubgVDA8byacGya26N57UadVLJD7KEjV3v8=;
        b=WeYt0rJXQw/eA3wVm1Q7WyKIU5qlNcZCg1WwD4m68K+tOOBu0b+aeutr5leHOZU7KU
         MXwMEG3tUGl9xeLgj1Oy5nGM2pGPbzww1WHlNfzylUfn1H9RWe7SFQjLlf9KY2/UAl6f
         r5r0mBUV9aNBhEg5u0Sn0snd8qYYr2hc4+5vipNagW5lyY7bp6MRQmF2LzL8bxQj0ao3
         rLPXNXq3Z4mjVmymH/4PyARNZRKcrREsOZvGVmES2ghCi0G5MDEbocQo7dFVdo0pmBP4
         tj9zyoHkE3urSyDM77bYifwLivK5aBV6/8VMecSvDsKOiyf+e2MaVP2DXTa0alK9ZG+d
         K/Wg==
X-Gm-Message-State: AO0yUKU2IE2oF88EYjtFN8OgXOlCSOx+7PN6xVB2azPLVnuzKyDqtNrD
	ozKfQPqeWBHz6KZrdRFOPgkbtA==
X-Google-Smtp-Source: AK7set/PZpsMUz4Si6epVj5Xk29Fp9cUg4PfUfBNqtl8qYNcExJeg+LuYMrEp71qE9lZhQLzeacgUA==
X-Received: by 2002:a05:6402:1391:b0:501:c839:cf90 with SMTP id b17-20020a056402139100b00501c839cf90mr7103329edv.3.1679522082373;
        Wed, 22 Mar 2023 14:54:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:626d:5729:6e71:4c22? ([2a02:810d:15c0:828:626d:5729:6e71:4c22])
        by smtp.gmail.com with ESMTPSA id x21-20020a50d615000000b004bb810e0b87sm8377005edi.39.2023.03.22.14.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 14:54:41 -0700 (PDT)
Message-ID: <50a6f96b-0822-66e4-be5c-46466766702b@linaro.org>
Date: Wed, 22 Mar 2023 22:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/4] dt-bindings: trivial-devices: Add Atmel
 AT30TSE004A serial eeprom
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20230322140348.569397-1-eajames@linux.ibm.com>
 <20230322140348.569397-3-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322140348.569397-3-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 22/03/2023 15:03, Eddie James wrote:
> The AT30TSE004A EEPROM is compatible with the JEDEC EE1004 standard.
> Document it as a trivial I2C device.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

