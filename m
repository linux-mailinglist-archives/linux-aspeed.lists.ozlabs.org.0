Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6781E4E8ECB
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 09:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRkT21z1jz3c1b
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 18:13:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.42; helo=mail-ej1-f42.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRkT01dPdz2xY0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 18:13:54 +1100 (AEDT)
Received: by mail-ej1-f42.google.com with SMTP id qa43so26635821ejc.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 00:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i8QlYXS+Du81ZL8BAubOYUiR6sHMTBbpMhIYqGeioDw=;
 b=uAqD1vRaZZOst8VTpeIuke9RfJ88FLiAe7o1R415OQdv6ezRKP7G/cXjhYbYxo1uOY
 IgExRS89ruw67a+GTx5qA8GAlKiLsqvMJPlesR5q5yd9jdOqTedrY/LDP7q5gbCPONzZ
 zn0SLHBlxBr8HB16pjkWAUMY1o+RwL+vALPkZKMMQ2H8fWxOC8GPzRiwmON0Lw13GR+c
 SVZougs+kW79yGQPgGqoewV4yFIIwsGQcIjZdyTOC4zno5QJvwWX8/sFSBpphOcJmv94
 6ZPLVeAorp3ESV8PBGRyWS/QYhvtn1YgjiFJUWJ7hz/EfWKRmF7siu42sN46WEcWSqub
 O71Q==
X-Gm-Message-State: AOAM533ELI6HK2A54yG4VaR9958EMnhtj2XK8O+nhJzphIjsScyjBg66
 SL44nO/lFHotH6o8hrfMXBY=
X-Google-Smtp-Source: ABdhPJwOhI5EiHsXr1N9eY5umpffcNKlnvT0NGIo3n1TkYqTaY5vnH59UzaXrBLXcigLKrx4krnSbQ==
X-Received: by 2002:a17:906:7f02:b0:6cf:86d8:c31c with SMTP id
 d2-20020a1709067f0200b006cf86d8c31cmr26807289ejr.518.1648451630660; 
 Mon, 28 Mar 2022 00:13:50 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 ky5-20020a170907778500b006d1b2dd8d4csm5585967ejc.99.2022.03.28.00.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 00:13:50 -0700 (PDT)
Message-ID: <94377113-b51d-8fb2-56fe-6f2abcea8ed0@kernel.org>
Date: Mon, 28 Mar 2022 09:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] ARM: dts: aspeed: add Nuvia DC-SCM BMC
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Rob Herring
 <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>
References: <20220325190247.468079-1-quic_jaehyoo@quicinc.com>
 <d0044322-72d8-1348-9898-dc91e3192e94@kernel.org>
 <92b381f7-6a4b-1db1-ea00-7bbc8c4b0f84@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <92b381f7-6a4b-1db1-ea00-7bbc8c4b0f84@quicinc.com>
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 27/03/2022 22:24, Jae Hyun Yoo wrote:
> 
> [...]
> 
>>> +	chosen {
>>> +		stdout-path = &uart5;
>>> +		bootargs = "console=ttyS4,115200n8";
>>
>> After adding stdout-path, please remove bootargs.
> 
> Can I keep the default bootargs for a case if CONFIG_CMDLINE_FORCE
> is enabled?

No, because you control the config, so just disable CMDLINE_FORCE if you
don't want it and such bootargs are not part of hardware description.

Best regards,
Krzysztof
