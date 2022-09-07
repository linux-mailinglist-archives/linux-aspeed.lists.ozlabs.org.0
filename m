Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40505B0CA6
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 20:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNB4G6r0Jz3bgC
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Sep 2022 04:44:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q69cPnFn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q69cPnFn;
	dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNB4B6qKJz3bY3
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Sep 2022 04:44:10 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id g16so11146535qkl.11
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Sep 2022 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sm2917QyW/IpUoyRYPzvoGiRSjCQ4oILKJa4Mo6YtaM=;
        b=Q69cPnFnPOquM1IwxkrETlKul9pY/zSHDSq8OQaOCIVhaBJ+VMvIz6o9VUe1Km4pbN
         WgcFuJz72wym4by1ybdyyvv88ZmkJAQGwZorjWfsJP+MJCb4zyBmwU1qvFBMo2+CY/eM
         KyZFufBpnydp9vnv90Ezln8ZhWa273iKmIavuUfS+2nebyPVKMW+p5jHupslYQtlHptb
         v5Mn2dWlwHOLWxloODGnfwkVUK2GP6PNlvTRziKf8X2fBdMRUrogZslablQJ84Yg1/96
         ET5zOBCJF09HRX6yLX5mE3ptgmTiZkP/SOByOuq+wqh8J1ZWmkwPw8n2KHjcVSUh/l+t
         UU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sm2917QyW/IpUoyRYPzvoGiRSjCQ4oILKJa4Mo6YtaM=;
        b=a8pafR6+oVuuyjiL5F4/XVdNnqNgIN0tFaINacrUkfOm0FJPegfrtkSTw5JKJ3U9hE
         q00V0FO7Ge25Q03MxtILQCVFJRZUaMqLMIr1pkN+i1hkU53uxOPnlRMoK6DxI8Sy5EiW
         /GaL0V9LyU0qVPLaY7Z9M2VTTkSWB35k0TTeC2jfw3V9/BLajrGeDGyHeo6eeAwAF0RR
         xHGZcaQ8C3C7YMGjor3A81kdq+WW1GVfzujKQjG1p+ZR3pyd8oeHq5Sy16UnCA3n4iTz
         /dVq715hA/upHL8eqnEVN0wUJYtkQYC+7Y7oE7uTDaE/BddJIwwtPCpXDwOtmX1QuRyC
         0H/Q==
X-Gm-Message-State: ACgBeo2pyEzhm0ueC6zAvxUateXNaxQ05kaHjNiMyMCqHpSIfqByqXm2
	d8Irmgd1hw8Io1/D2TWiLe0=
X-Google-Smtp-Source: AA6agR5IWIv5rr+ytIUtjyy/FfMPmJaqd00l6tl/LsbBSZg2aWEo6E2wOEQaVOwBiJDQmwJJDvZajg==
X-Received: by 2002:a05:620a:1470:b0:6bc:476a:31f4 with SMTP id j16-20020a05620a147000b006bc476a31f4mr3806296qkl.501.1662576247984;
        Wed, 07 Sep 2022 11:44:07 -0700 (PDT)
Received: from [192.168.1.102] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id dt46-20020a05620a47ae00b006a793bde241sm16116704qkb.63.2022.09.07.11.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 11:44:07 -0700 (PDT)
Message-ID: <7f3a2e42-6214-c41f-90f7-53ee637a720d@gmail.com>
Date: Wed, 7 Sep 2022 11:44:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH net-next v3 2/2] ARM: dts: aspeed: elbert: Enable mac3
 controller
Content-Language: en-US
To: rentao.bupt@gmail.com, Andrew Lunn <andrew@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Heyi Guo <guoheyi@linux.alibaba.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>,
 Guangbin Huang <huangguangbin2@huawei.com>, Liang He <windhl@126.com>,
 Hao Chen <chenhao288@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220907054453.20016-1-rentao.bupt@gmail.com>
 <20220907054453.20016-3-rentao.bupt@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220907054453.20016-3-rentao.bupt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 9/6/2022 10:44 PM, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Enable mac3 controller in Elbert dts: Elbert MAC3 is connected to the
> BCM53134P onboard switch's IMP_RGMII port directly (fixed link, no PHY
> between BMC MAC and BCM53134P).
> 
> Note: BMC's mdio0 controller is connected to BCM53134P's MDIO interface,
> and the MDIO channel will be enabled later, when BCM53134 is added to
> "bcm53xx" DSA driver.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
