Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D83544661
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jun 2022 10:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJd8t4kqdz3bmg
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jun 2022 18:50:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uHvfPhhe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uHvfPhhe;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJd8k6bDpz30DC
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jun 2022 18:50:28 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id x5so25172898edi.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jun 2022 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lxOgUlJyz8a7UYb2M1MBxjNZkRHBfLtu/g8L8My5Mz0=;
        b=uHvfPhheb4CBnufbTCJYyiEXKEJb4FHVu97WqK+OZ99EN+3+lwLY/hnMPEHxqm1vjU
         Je7qViUqfurEOwe564htO7TN4UD/MUxZ0jBRaMZ1gFzpyzVWiKoW2U0pYLnx4iFethuC
         BaskC2CbbuH7PpRgKV3Iwn/g4TfK79/bVNxqLMJKweFVMKOBy3UKRDqwrw2VCfopzuQo
         Xit79lWfe/2kOFDMIC7CMbbu+aHPRTA/Lq7PExIeZOuLf7zwUYYiOlIvrNiGxOZHEE//
         d9Xj9e5Inve8xWME4NcUMYmHj18ro6RiiWyxlCPWuJFp0m+HH09eJ6K52N/hURkJcJ65
         Y9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lxOgUlJyz8a7UYb2M1MBxjNZkRHBfLtu/g8L8My5Mz0=;
        b=0VJOEMm2GkRExpSt5X0zdDpa+ixH3GI9c6fzVQE/AdWDi+DFbyWGgAHp6++xDmzlUu
         ydL8csHByfVfW6Vm6Gr95oX5UsSl5qaN52rd0lJjlQrdk1ImzBZEnn4nZpbA5FqDM6AF
         RKFhcJOmlasgLrWkS/g4ru4gDd0qYARwPfQfMX731JLLEyNzXKdqayliRt490QhVhRlk
         ijMX8174bhJA5EEQ+Tq1qsL1xLN7Qc0VGfRHUu/Ll35e5L30UNUzmXCTKMovmPvdqxAU
         DpMFOFVQvj6+cehue7kZ6+OOB3vSbSHCwi3Hlj97VVuTbkiE+GnICr35nRI+U7A+9v/a
         yIWQ==
X-Gm-Message-State: AOAM5321Z8LO/IQbZlfjezJvmxzii5N3vZB+CxDiTJnz9WJt9MwYtSLI
	n+V66JNrhTrSlVAZmS0Zpm2W+A==
X-Google-Smtp-Source: ABdhPJxopZoI5H9UIi9hA0nAtC2Lsd7tS3S03ZDv5nUh3GJjBFK2zTrrgHW1da594jw7949GsRgytA==
X-Received: by 2002:a05:6402:1f83:b0:42d:8d6f:a5d4 with SMTP id c3-20020a0564021f8300b0042d8d6fa5d4mr44413558edc.74.1654764624093;
        Thu, 09 Jun 2022 01:50:24 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jt2-20020a170906dfc200b006f4cb79d9a8sm10311094ejc.75.2022.06.09.01.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:50:22 -0700 (PDT)
Message-ID: <c86be8e0-8350-5d73-8055-e04a4e88f3b6@linaro.org>
Date: Thu, 9 Jun 2022 10:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: document several
 vendors for Aspeed BMC boards
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Steven Lee <steven_lee@aspeedtech.com>,
 Ken Chen <chen.kenyy@inventec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
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
Cc: David Wang <David_Wang6097@jabil.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 29/05/2022 12:49, Krzysztof Kozlowski wrote:
> Add vendor prefixes for manufacturers of Aspeed SoC based BMC boards:
> ASrock, ByteDance, Ingrasys, Inventec and Quanta.  Move also bticino to
> proper alphabetical place.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Joel, Andrew,

Any comments on this patchset? Are you going to pick it up? If you
prefer me taking it, I can, but new boards depend on the bindings, so
this should rather go via your tree.

Best regards,
Krzysztof
