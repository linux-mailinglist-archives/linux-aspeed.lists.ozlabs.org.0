Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 378FA4E3ACF
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 09:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KN4gJ0KPDz2yjc
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 19:40:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.45; helo=mail-wr1-f45.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KN4gB0cBPz2xgY
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Mar 2022 19:40:05 +1100 (AEDT)
Received: by mail-wr1-f45.google.com with SMTP id m30so14023818wrb.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Mar 2022 01:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/Tfn3grWM8EBZ0IFyy5BUNygjofN0WZXFLyZhdj5fD8=;
 b=kEABXhTg8ZELDWx56utWExL1dY9hFxy2cZzlIE/+83kgZBad11Sl+uKIUplbBIX8go
 TJSKcSZupe/cPlxOCWiJWNarsJn3rtvJAAJmIwpkOADVJdZAWw2gpWAA586B4bW6YV/G
 g0QqTpwCfASNWVwrafnnMgGLqI0JPlYExVypnQSjT+fUP1nsck+vpeMQ/OQxd1U9x4KS
 OStiShehZI0hD53UhHeec0W3nWLVWUVLc+TuCNW59FBcGR2pHpiW0TgRWRduxHBfT5KU
 J6TdHF2voclTmCYK4e8pPr11brexiNVQEtQBGVE+os5MUVb3tLR01WdzlFlbiHrtBHuW
 EhMQ==
X-Gm-Message-State: AOAM530WpTgSWQG4cHC2r/hPUonbVSOCKf7kx7KkMK9xp5FSodUIfyqJ
 bdNUiMmOzJPZTAdu0Gb/8mw=
X-Google-Smtp-Source: ABdhPJxkORCp7gIYkTNw3KV3bdX3kmbwKYImn33rbcbzHbL5oapUbtQ9rTY8znVVhU8GFn8NowZFyg==
X-Received: by 2002:a5d:4609:0:b0:203:e792:3add with SMTP id
 t9-20020a5d4609000000b00203e7923addmr21101655wrq.657.1647938402451; 
 Tue, 22 Mar 2022 01:40:02 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 i10-20020a0560001aca00b00203daf3759asm16563813wry.68.2022.03.22.01.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:40:01 -0700 (PDT)
Message-ID: <216b98d5-a254-4527-c569-9f3397811e70@kernel.org>
Date: Tue, 22 Mar 2022 09:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: add reset properties into MDIO
 nodes
Content-Language: en-US
To: Dylan Hung <dylan_hung@aspeedtech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20220321095648.4760-1-dylan_hung@aspeedtech.com>
 <20220321095648.4760-4-dylan_hung@aspeedtech.com>
 <eefe6dd8-6542-a5c2-6bdf-2c3ffe06e06b@kernel.org>
 <HK0PR06MB2834CFADF087A439B06F87C29C179@HK0PR06MB2834.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB2834CFADF087A439B06F87C29C179@HK0PR06MB2834.apcprd06.prod.outlook.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 22/03/2022 03:32, Dylan Hung wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
>> Sent: 2022年3月21日 11:53 PM
>> To: Dylan Hung <dylan_hung@aspeedtech.com>; robh+dt@kernel.org;
>> joel@jms.id.au; andrew@aj.id.au; andrew@lunn.ch; hkallweit1@gmail.com;
>> linux@armlinux.org.uk; davem@davemloft.net; kuba@kernel.org;
>> pabeni@redhat.com; p.zabel@pengutronix.de; devicetree@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
>> linux-kernel@vger.kernel.org; netdev@vger.kernel.org
>> Cc: BMC-SW <BMC-SW@aspeedtech.com>; stable@vger.kernel.org
>> Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: add reset properties into MDIO
>> nodes
>>
>> On 21/03/2022 10:56, Dylan Hung wrote:
>>> Add reset control properties into MDIO nodes.  The 4 MDIO controllers in
>>> AST2600 SOC share one reset control bit SCU50[3].
>>>
>>> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
>>> Cc: stable@vger.kernel.org
>>
>> Please describe the bug being fixed. See stable-kernel-rules.
> 
> Thank you for your comment.
> The reset deassertion of the MDIO device was usually done by the bootloader (u-boot).
> However, one of our clients uses proprietary bootloader and doesn't deassert the MDIO
> reset so failed to access the HW in kernel driver.  The reset deassertion is missing in the
> kernel driver since it was created, should I add a BugFix for the first commit of this driver?
> Or would it be better if I remove " Cc: stable@vger.kernel.org"?

This rather looks like a missing feature, not a bug. Anyway any
description must be in commit message.


Best regards,
Krzysztof
