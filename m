Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E212D529509
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 01:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FVt65Rrz2yXM
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 09:16:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WOTncPc2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WOTncPc2; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1pNR3Zjqz3bcZ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 May 2022 15:54:13 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id j4so23903593lfh.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 May 2022 22:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iQu4lukAu6aND/lSxHXOC9CQZKXgScz0FZajkncufEw=;
 b=WOTncPc2v5NZjRnTIJIh4IXO1dj9ckDUzbSMpFADqaVVFteQj9TEczbboaO7BSW2/s
 XISBzIocyQtoLTgR7gWJ/xy+YDxJlUaAAnAbtnBo+Ja4yyTkPE3dNrqwQyJL1N6Lt4H0
 ++LYr9UXQs5/Qplz1Zqp2mpf5Mt3r7P9Z9O4UHYmkTLk3lPXMJ1Bwkihocd9f4kVWpdk
 3IzpmTfXxrlrmJeAStqS0d+5hFCtGcTIYjrwdLrzg/HL53pH2ksHGVkx5ljLbGLK0EZE
 n33jLIToD1mvWSg0ZTsItxhaHXXnCYpgLBJ7kwzcMxk9kRkJfIChVs5xPxBONi0DnCfU
 rI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iQu4lukAu6aND/lSxHXOC9CQZKXgScz0FZajkncufEw=;
 b=U6hPHMMFErZRy0YZqiT2yd4nHRDvmSUWCsea7bI+BzzuP74OtWM9UJO4+alQzB3tGZ
 2HCHCnzs9zNHoIj5DTWIzMqFAGAeOdQJ4BGbRThIoPzX5/skIStM4P62wO0ENCxRX591
 BWe/fKkgz3cM0gYJCKlr4dU0gnNkpLNO29Rq0gOPvQl34pYMA8GKMO3CY0Akq7zVk1ai
 Qxk7JdEeHZPzC2zszILsyPzdB2eLlhBFN8rxEdIH0IhMvVqZQ84YKF3yvcTXxZRyAjgU
 Cl3tMV0WQeJUxfzru+rU2VbeGO0H2250p5WNo9KnoIkAe68OP8B4zmnIs4402vQR8Ww3
 kG4A==
X-Gm-Message-State: AOAM531HX+AS2wyj9Z4ln2p+aRCowfoo1mhsvG2MkFVnvJaqwuvk9H3f
 n1KvRDxLaJdfc2xIuoP0prlwJA==
X-Google-Smtp-Source: ABdhPJxDB/Sa5OHAguWRCgpV67m8ipVKXudtdyV00vw1QteYiiQh9fRXMYiofl5SGOVzWKsH/Wkjhg==
X-Received: by 2002:a05:6512:228d:b0:473:f729:3219 with SMTP id
 f13-20020a056512228d00b00473f7293219mr12132861lfu.428.1652680445339; 
 Sun, 15 May 2022 22:54:05 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m20-20020a2e9114000000b0024f3d1daeb5sm1384293ljg.61.2022.05.15.22.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 May 2022 22:54:04 -0700 (PDT)
Message-ID: <3499cca2-1d7b-12f5-adbe-0c9b279cc51a@linaro.org>
Date: Mon, 16 May 2022 07:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
 <20220513065728.857722-4-neal_liu@aspeedtech.com>
 <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
 <HK0PR06MB3202679A7FABAF7D0D045F0880CA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <567d135b-3d40-9958-e000-1357020b5650@linaro.org>
 <HK0PR06MB32020539063F8A7C5D56E0B980CF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB32020539063F8A7C5D56E0B980CF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:46 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/05/2022 03:59, Neal Liu wrote:
>>> Okay, I could rename it for next patch if you preferred.
>>> But there are lots of yaml files which are not named as first compatible.
>>
>> Yes, I know, I quite likely I also produced such bindings, but a specific name is
>> rather preferred. Otherwise you will have a difficult naming choice when your
>> next Aspeed UDC requires new bindings file because of some differences (not
>> yet known now).
>>
> We can rename the bindings if next Aspeed UDC needs, don't you think?
> Currently, Aspeed has no requirement.

So just use proper name from the beginning....


Best regards,
Krzysztof
