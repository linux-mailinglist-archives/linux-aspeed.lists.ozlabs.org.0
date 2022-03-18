Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5AD4DDAC6
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 14:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKlc26GR2z30RJ
	for <lists+linux-aspeed@lfdr.de>; Sat, 19 Mar 2022 00:44:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.50; helo=mail-lf1-f50.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKlby2DkYz3096
 for <linux-aspeed@lists.ozlabs.org>; Sat, 19 Mar 2022 00:44:12 +1100 (AEDT)
Received: by mail-lf1-f50.google.com with SMTP id l20so14126365lfg.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Mar 2022 06:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+13Af56+e0RqW04Edcq76EyluIRDM9JaL8dIazHbckc=;
 b=USRJrmWSYGIdeB52h4e3oD3LfG7Q8abpu9V4aUNVGxxO5Ttl8UIBZsd7sszRh7RI1b
 CvLrBPjfL6sC6sFz1PzfgfLASXNK/zjvyLwvWWQ13fug9Hg23zmMBNxhZ/29zSLNr3jZ
 JNXBQysCSxFP+7OFEZXPhqDW4bsAVqTIKL+/ngTNFwNqjsvoLD02qnqrr0UFBeAyZV62
 LOk1izn+S0d8j8MyFn2g/Fuza3hJ59lZucA/OcOoKcVuFR1EM0RAoL2ocpSji85LcLZg
 kn1jBHw+JCdJgvctkDdf3u6+EChhxmfuqiEpdstpwn4Xr8tzs56NIDp4qsVknCs7SLpZ
 7qQg==
X-Gm-Message-State: AOAM533G1ztkiWefO0eoa9w8863QoyJhIl6+3+/eRB0uVeVc99/kBqPG
 1MxfGa4D1thVabHbO8TLG0g=
X-Google-Smtp-Source: ABdhPJxBG0gMB7P6i31hX6URblEoIk15XK26/WiOk2L5XQrQkklk9dI2CS32ZTycPzHM2+9Bp954qg==
X-Received: by 2002:a05:6512:2613:b0:448:5164:689d with SMTP id
 bt19-20020a056512261300b004485164689dmr6030983lfb.526.1647611048126; 
 Fri, 18 Mar 2022 06:44:08 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 y23-20020a2e95d7000000b00247e4e386aasm965319ljh.121.2022.03.18.06.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 06:44:07 -0700 (PDT)
Message-ID: <ad56b5bc-a9d4-b584-3c04-7c47995381f1@kernel.org>
Date: Fri, 18 Mar 2022 14:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: Remove arch timer clocks property
Content-Language: en-US
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220317191527.96237-1-singh.kuldeep87k@gmail.com>
 <20220317191527.96237-4-singh.kuldeep87k@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220317191527.96237-4-singh.kuldeep87k@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 17/03/2022 20:15, Kuldeep Singh wrote:
> 
> Moreover, clocks also matches incorrectly with the regex pattern.
> Remove this entry altogether to fix it.
> 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

Except of ongoing discussion, this paragraph is incorrect.  There is no
incorrect match of regex pattern. The field is simply not documented in
the bindings (not allowed by bindings). This paragraph is actually
confusing and misleading.


Best regards,
Krzysztof
