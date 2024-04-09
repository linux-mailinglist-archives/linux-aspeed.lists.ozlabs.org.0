Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E395790C
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHr4b0Bz30g3
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lW/frNdp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDPjH6wfVz3bXk
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 22:02:42 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56c404da0ebso8215196a12.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Apr 2024 05:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712664152; x=1713268952; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkRKDf5GLr5pj942wy9NJKid+umpjbRA7GynacZfPEQ=;
        b=lW/frNdpZj8Endc7o5aoH8xnamcZ7qfec8Ju633fyduIfhWSAtIwAAIy9Gso74s3Gp
         RVS5lnUUcfkCnf1R9u8HS0jZUu93h2qwH3hBTwXUcHkhHpIWvKXI3whpUOR3m2HUraja
         e02vttC4m+TbbeUA+p4dT4UiQu60lasmfJ3CsrqGR4I0QBzq/OcS3ccz0y/LcCubLixM
         YasNm7VfYUAdpUYKQ0GHYQTs32dV2762b0LtKq8+HHy41Srte2q92kCAocwVc/t5dpOo
         htpL8kNMfXNrXijZXQNO3N/unl457NesGNNRdIICgQMFiCMiobkpknVQ2fRXXeR3wNar
         yjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712664152; x=1713268952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkRKDf5GLr5pj942wy9NJKid+umpjbRA7GynacZfPEQ=;
        b=FYhQnMoWLuwCICy2RnXQb2Qt0u2D6Xrtj4T0B5xsSNGHP4TLgPgiyeBrHyNU7BUrl+
         dwsxNMNz6ZRBhYTZyqI8dFwLgSBh9Cf1A6gro/w93bpB0RShvQHXNCPZUi1JyFO0fl7r
         qPek6Hfig75fI2nxZsPj0SjpP9LdiYwYbgVbDVAzjqIP6dWVRjFO23YYfk1f57Xmb29c
         bSQnatnB0jknehFIOQq/Z80UdaGMsydZj1AoKJH4DwTkPq2gr9xzTjCBsfYuEpPx+854
         zGfNtwE7ObPHs2/rKyLqFZx/LfeJtns39hhCSq3qhMh7RcB8CSZntsO46JWTqxpwVnfZ
         9YIA==
X-Forwarded-Encrypted: i=1; AJvYcCXlE6Vpm7wM+QnWrEUkx36EHRRx8z2IOvkh9AwtBtv8Eu65rhlWpQtsaaygAAE6hNXIxw6MRktXf/E7DqmEKDrnhQ7YY9q7g7yMBraolw==
X-Gm-Message-State: AOJu0Yx/XX924l2kKEGLxJdS0oN6M/hcSCLmdYjMcd8OqmkMJrn+UXwh
	g5gGfOi3lJuP0+3rF5DCdNIkoTOopKp6K5+ybrg1EGidy/DOpnSk
X-Google-Smtp-Source: AGHT+IH3wXGsiaRiem9EQMmXVabh3sBI1WiYbDC3AT/ATTb2okPbMfexW2j0doktw3Yi0bClXEyv6Q==
X-Received: by 2002:a17:907:31c9:b0:a51:ddc6:edc1 with SMTP id xf9-20020a17090731c900b00a51ddc6edc1mr3751319ejb.28.1712664150849;
        Tue, 09 Apr 2024 05:02:30 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-64.cable.dynamic.surfer.at. [84.115.213.64])
        by smtp.gmail.com with ESMTPSA id jg18-20020a170907971200b00a51a60bf400sm5466509ejc.76.2024.04.09.05.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 05:02:30 -0700 (PDT)
Message-ID: <a4283479-2c4a-4f8f-b224-999dd12ba009@gmail.com>
Date: Tue, 9 Apr 2024 14:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] rtc: convert multiple bindings into dtschema
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
 <20240409102658d86fb2bd@mail.local>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240409102658d86fb2bd@mail.local>
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
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 4/9/24 12:26, Alexandre Belloni wrote:
> On 08/04/2024 17:53:00+0200, Javier Carrasco wrote:
>> This series converts the following bindings into dtschema, moving them
>> to trivial-rtc whenever possible:
>>
>> - orion-rtc: trival-rtc, referenced in arm arch.
>> - google,goldfish-rtc: trivial-rtc, referenced in mips arch.
>> - lpc32xx-rtc: trival-rtc, referenced in arm arch.
>> - maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
>> - rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
>> - pxa-rtc: add missing properties and convert. Referenced in arm arch.
>> - st,spear600-rtc: trivial-rtc, referenced in arm arch.
>> - stmp3xxx-rtc: convert, referenced in arm arch.
>> - via,vt8500-rtc: trivial-rtc, referenced in arm arch.
> 
> Probably all the moves to trivial-rtc can be squashed.
> 

Sure, I will squash them for v2.

Best regards,
Javier Carrasco

