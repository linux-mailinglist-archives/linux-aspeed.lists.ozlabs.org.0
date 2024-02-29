Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A300386C8B5
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Feb 2024 13:01:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ia7WaNMd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlqZS1zsFz3vX9
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Feb 2024 23:01:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ia7WaNMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlqZK4cx9z3bmq
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Feb 2024 23:01:28 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so1294094a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Feb 2024 04:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709208081; x=1709812881; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBlf8HoFNmQlPXKUBDlOcxdRxoNNGRE/tP5p7n7r1Mw=;
        b=Ia7WaNMdeAJatGHcXCEhsOfLjuqcLWA2B2lfTAlc06eN7nGQd6Qg8Wy33oQEM2BNiW
         CzEB7ODMX2mozQgYxUD9vwqxXTRaZPVh8RiYcIE+6NFLVGy0FXMrwJEMtvJpJILvbly2
         u7v1nFsXBqTcBq5LED+9SwGB0Lxi8ino0klMS2P+g3aSNdq/2XK9l+jHVDu8EC6B880f
         ZtExVzTG1NKTNbBiF6eYuwqTC+WRpkwnEgafT7NyP2LvE1/PjIwN3MuZ6St/JLXUEBs5
         FTIHNWy+CyBXSJe/2tKTjFMDpAF/A3ackkgWf3JgD4Z91A5CoE9SIe528OzHBA2HgPUa
         2RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208081; x=1709812881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBlf8HoFNmQlPXKUBDlOcxdRxoNNGRE/tP5p7n7r1Mw=;
        b=YjkJJmNmSlDGAlYgZb9a0ExqJSvKegX7U98VJqmSSDlIUqAaZPkO7BCu5tN6jWuycp
         m4HXSi06xRUnka8rDiez4rG/7fJl8zwc9fp6HTK7vQDd7ZfXQJuRyFCStvoBgZ1blUsa
         XQKsN5uf5kfjDvJmRoKzTc6U/RoQQEcm/sClL3bo4UlCNDNfA9DE4qwhRCCdpF96EsuV
         p8GGho3NiQYNwQX+YsUx2dzm/oIFHpOmWaWVeLl+zqCeWwQvUIX49Xm9yHsa/U9Ae6Yh
         3370Lhv09YCjpLmM/4LAf5yG9Qm58Hftn2KNYvG9dLaBjIFdiuC/AhD3Rg9U64W/EOTs
         ymbA==
X-Forwarded-Encrypted: i=1; AJvYcCUYjQqgP1hbGf7s4HZmCK6/Y+zwixjxALj4PkwnmNlIMB0aedRa5gM8Izvtb8HuftwKVnWprOYzHQCu+OWLZFD+IbKjeMWTOKQnRkDrYQ==
X-Gm-Message-State: AOJu0YyXT5gjQNgqP46QvPuHEa3gQ4LFgBj5H42Z8OXt/hHi1FUHZrJL
	BhYXyDZHvsZOeUEPmD/oT14NTQKR94dEv5WiAQ7ZWM1dW/lzDNhYHL/1HNS7GNs=
X-Google-Smtp-Source: AGHT+IEm4sxibAecNOSABVhUlzbFIYcM3cnU6Y3UzHCXyIXvvwJ2yT31xsOH4L43KVOJSoC80Facsg==
X-Received: by 2002:a17:906:4152:b0:a3d:2243:29da with SMTP id l18-20020a170906415200b00a3d224329damr1278820ejk.36.1709208081181;
        Thu, 29 Feb 2024 04:01:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id d25-20020a17090648d900b00a4339b8b1bbsm610795ejt.212.2024.02.29.04.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 04:01:20 -0800 (PST)
Message-ID: <1286ec46-b721-4c44-92f1-a79229e1c08b@linaro.org>
Date: Thu, 29 Feb 2024 13:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Content-Language: en-US
To: =?UTF-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>,
 Kelly Hung <ppighouse@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20240229090913.1892215-1-Kelly_Hung@asus.com>
 <7f60e293-8076-4a06-9b6b-35f9c19578c4@linaro.org>
 <TYZPR04MB65960D379D89A5C3C4A0B13B9D5F2@TYZPR04MB6596.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <TYZPR04MB65960D379D89A5C3C4A0B13B9D5F2@TYZPR04MB6596.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>, "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 29/02/2024 12:18, Kelly Hung(洪嘉莉) wrote:
> Hi, Krzysztof,
> 
> I also confused, if I lost all from v1 to v4 change log? If the answer is yes, I had added them in v5.

I asked to add proper tags and gave you link to exact paragraph
explaining this.

Open the email and inline, not top-posting, answer to each sentence you
find there. You were ignoring all them and not responding...

Best regards,
Krzysztof

