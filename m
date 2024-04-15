Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E43295791A
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHw0FHhz3g7S
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iCU8sGkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHy8b5v3Rz3bmN
	for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Apr 2024 16:35:11 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a44f2d894b7so286446966b.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 14 Apr 2024 23:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713162907; x=1713767707; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eO+zx6q8xRqWwJnnrLSN3wSPdu79Tj6Uc62vZSkTLvo=;
        b=iCU8sGkOGJ6kfFe4niVeJU+2NXhEI+xtHfUIxL40FlzSQENY5ARorWcoqkTth8RTTO
         0LHnkbMt3Z5UCu68pmLA1MW8USzpRZj5nqJwWU8MGNUHF43llM5/s6I3iiBiPtM5drK/
         S327fkJP6Enw1Iurstum2B6egKAOvn0Ws7DXewihIhVve680kwKtLGQMe8Ro1B9quMNo
         eF0DyuxF/Dpo20bEDWTJ1Z1wFEIG0DIpYYpt4L2SRTIwBcqsaS5vhx68iNNrAsS5x0zs
         HkFmiDOz+N8z9A0uoeTWYj3EyEkjB64QB+NMpPqikZz3mpvU1chDTpoFOoxFKGkqWR6m
         6ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713162907; x=1713767707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eO+zx6q8xRqWwJnnrLSN3wSPdu79Tj6Uc62vZSkTLvo=;
        b=xR3PrS4v90NMou7ps1faNOq0WSTsyjJ1VK9EK7GifmXsRctXC+NDjm2fa53oKka7ZD
         vtGrejHliIJNKMv31sA0Bm9F2/CntFgTfBORxdw+hFZnRybwHkLzkAktRQXqu/PwKhGE
         0HkvmAPowhFV+HW+8zZ1fwJOi1esmAjVBgPsUAxdKGdqvQTV84ZCwNUfgaOW8t62rSoJ
         KJw6i/6k5AXPpXdtfVjuA0GfHO7UmaCfrBg9xUYW0oebtmM0NzWLjHZ399EOP9YP+oKH
         p+feK4/vBpFxY6qzHgo7ptiNqKgVosnGPZ+aFMM+YslD9/JPrRGCnADlr/YW5jvdS7JB
         t7Og==
X-Forwarded-Encrypted: i=1; AJvYcCXGoSzAYJ6ZAlMwWzAj6MTfIEmgs3TcuZwkmb6T5NL+vF3YlJGYiir1evStQCpZknb+oqWl6ptZE1fnKxwJ3OllQX6gJs63iXZxIDB5Kg==
X-Gm-Message-State: AOJu0YyUY1CcJyM2zGW69VeZoYKBVPsyWknI8z2PCJPx6a6I6rmNEBft
	atEWtAtT5wW/3YKBQzkTjymyg8bzczR4+MIwlxIEDepOdg3hK77i
X-Google-Smtp-Source: AGHT+IFBOaepaDHEEJj8Porx550BDTPgEDltcVsWd0z0QitZDRqQ83vy5NmfqW3SvdZYQ/SrAz8Q5A==
X-Received: by 2002:a17:906:b80c:b0:a54:3e6c:c9d7 with SMTP id dv12-20020a170906b80c00b00a543e6cc9d7mr271692ejb.65.1713162907275;
        Sun, 14 Apr 2024 23:35:07 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id ae12-20020a17090725cc00b00a529aeb4eccsm412271ejc.140.2024.04.14.23.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Apr 2024 23:35:06 -0700 (PDT)
Message-ID: <9b33192d-6245-45e1-bcba-c2339e18f77c@gmail.com>
Date: Mon, 15 Apr 2024 08:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: rtc: convert trivial devices into
 dtschema
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
 <20240413-rtc_dtschema-v3-2-eff368bcc471@gmail.com>
 <82fcd7a4532df119f82ea55208f592460ba5358e.camel@codeconstruct.com.au>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <82fcd7a4532df119f82ea55208f592460ba5358e.camel@codeconstruct.com.au>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 4/15/24 02:09, Andrew Jeffery wrote:
> On Sat, 2024-04-13 at 22:22 +0200, Javier Carrasco wrote:
>> These RTCs meet the requirements for a direct conversion into
>> trivial-rtc:
>>
>> - google,goldfish-rtc
>> - maxim,ds1742
>> - lpc32xx-rtc
>> - orion-rtc
>> - rtc-aspeed
>> - spear-rtc
>> - via,vt8500-rtc
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 
> We have trailers above but then there's more commit message content
> below. Looks like what's below should be trimmed out (bad squash)?
> Maybe the trimming could be done as its applied?
> 
>>
>> dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
>>
>> Convert existing binding to dtschema to support validation.
>>
>> Add the undocumented 'clocks' property.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 
> Andrew


You are right, the commit message content below your comment should not
be there. I can send a new version to trim it away if that is preferred.

Best regards,
Javier Carrasc
