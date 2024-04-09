Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E46D295790B
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHr2xRCz3fvv
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mZ0S5aZo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDKVQ4VpZz3cGw
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 18:53:01 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a44f2d894b7so604826566b.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Apr 2024 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712652777; x=1713257577; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0jIR2OL0GyuZ7AB0nPnmYn4Ft44qzFta5fRUBXkOno=;
        b=mZ0S5aZoHDBtbF7g9A5i9kZuRPGtRLABzxlG9gtHtrPD3A9Jk0XDHfibfrvGWwS0YH
         KJaEY1RPm4ZXg6fQm9/XsBBptyzaHtRMJrgR7G3ziiInK/NtvGwapDZeO9eD67oSoG5N
         XpZoT4CaVzTdgQ+3WT288Tt1GvyQIqQ+xpPcn7ADzJoTQ7GPUVekP6BLwYVqifcG5SD3
         HpRfGbUlrgfjSUyxTcmqJ8yz/vrnYPE8/FQEji5/3spEPqZda9au0XDH0+6/EbK/TnK3
         JQRgxr9+XWO5Sm4YSTkevRqekuKmAxDR7yFq/VJz+kbt65b8PucXVGGyyMLW+MZC2pWe
         0cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712652777; x=1713257577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a0jIR2OL0GyuZ7AB0nPnmYn4Ft44qzFta5fRUBXkOno=;
        b=t+Q0Q0yuDjXaUL2fcIb5t5QFBGMg238lDQyY99003Q7aiDA0vrvOhKnyvN7pTB4R0o
         dUbwUNe2ZIsS3NaqyJemUsy+C4UR5E2lG75KgeaOTL4flPj18dd7EghcCHEyZ+SWH1M2
         4CK07KjN4V14gvARCSTbrK9PRMOwYrl6wEb4do/zG6Xu/OKgLWcU7JImx8bDEE0/8RBr
         Qnwpt84htsNEPdRrzYGPv8vtPidWhBCNtByh4USOjXoi1dd9VfaD+Puy8LMNY7BX11PA
         gKIvyma2AsDcELRMloIHIT64tIc966RHU3ZkZo2lQUboh7LELthZ5FKnnmqKQXuHKni+
         5bWA==
X-Forwarded-Encrypted: i=1; AJvYcCXridqDexC1PsrXcfrwA89TZSu3+SGlWRbZIiYHqTRlMGJrNHEBOVvMBMHcXcg/pJMZ34ZjCyb8nJ6u9UahB7MtgI6VQ9xrPXKMurmC+w==
X-Gm-Message-State: AOJu0Yz/q0CjUYQyt/w7J0aGnF2k7Nw69rTp2yCz4WdJxQ3FbHkjo4yb
	Rgy5V9BjOXaXwCL12EfhnsXOchdcGzEGDzwa0eE5Iuxg+HRytneD
X-Google-Smtp-Source: AGHT+IEAFHw1NjWQVbVzBzYATvddUlqkzBcIRzHxlgvPpMiPiCZOtlevHR5EjAtm+ZEjmL4iwtsgFA==
X-Received: by 2002:a17:906:6c97:b0:a51:88e5:5451 with SMTP id s23-20020a1709066c9700b00a5188e55451mr5956856ejr.29.1712652777110;
        Tue, 09 Apr 2024 01:52:57 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-64.cable.dynamic.surfer.at. [84.115.213.64])
        by smtp.gmail.com with ESMTPSA id ak2-20020a170906888200b00a51dccd16d9sm1836588ejc.99.2024.04.09.01.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 01:52:56 -0700 (PDT)
Message-ID: <6dc808bf-682f-4e91-aac7-7ce6f05a0ab4@gmail.com>
Date: Tue, 9 Apr 2024 10:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: rtc: lpc32xx-rtc: move to trivial-rtc
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
 <20240408-rtc_dtschema-v1-3-c447542fc362@gmail.com>
 <dd5e9837-0dcf-4b0e-8d11-f8bed868cdf2@linaro.org>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <dd5e9837-0dcf-4b0e-8d11-f8bed868cdf2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 4/9/24 09:34, Krzysztof Kozlowski wrote:
> On 08/04/2024 17:53, Javier Carrasco wrote:
>> This RTC requires a compatible, a reg and a single interrupt,
>> which makes it suitable for a direct conversion into trivial-rtc.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt  | 15 ---------------
>>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
>>  2 files changed, 2 insertions(+), 15 deletions(-)
> 
> This one no... and if you tested DTS you would see errors, although you
> need to test specific lpc config, not multi_v7.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> Anyway, you *must* check all DTS before moving anything to trivial.
> 
> Does it mean all other bindings were not checked against DTS at all?
> 
> Best regards,
> Krzysztof
> 
Hi,

I did check the conversion against nxp/lpc/lpc3250-phy3250.dts, which
throws a message about the 'clocks' property.

That property is not documented in the original binding, and even though
it could be missing, I could not find any function to get a clock (i.e.
any form of clk_get()) in rtc-lpc32xx.c, which is the only file where
the compatible can be found.

Is therefore the property not useless in the dts? My apologies if I am
missing something here.

Thanks and best regards,
Javier Carrasco
