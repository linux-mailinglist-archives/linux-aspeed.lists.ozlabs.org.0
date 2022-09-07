Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9785AF951
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 03:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMkdv0GCTz3bbj
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 11:08:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BXCJ/81w;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BXCJ/81w;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMkdp5D96z2yyT
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Sep 2022 11:08:12 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id s14so3377519plr.4
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Sep 2022 18:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=4/ZIZdVDq8QafnDshkBp2uy/VhVapnzNn87zZZcPkMs=;
        b=BXCJ/81wXRUVjLzY5YNY5ye2rZiq86cruthWzZHRASDILgN42toBND9Kb/oCI8DphG
         wOIZs5V3vi3G2eOQ8siyMkOd0WguXRDXSLb5t6LhaQm6ADHwIEP81mnE2AGSMfO/+krw
         Mr65tQ0TG93dXkc8fXfbTgIUIl/G8UnEASBjLNMoKbQHAAskGXHNmOULrObU/hUKCDua
         AeukbRKsMK3P+J3bP1eBo/mEYdhQNlqEShfWIKtcpVPBTrJ7L3YYPOo9pOpJMvZmjN76
         MLWvhHFAeCKvXXsFZRSfaakgapGZlABn/kUgXHUNLrIDOPQlbYaE7Ik5yvYU0e6HUMlt
         jaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4/ZIZdVDq8QafnDshkBp2uy/VhVapnzNn87zZZcPkMs=;
        b=TX5it8IFEnHr0ZMEwGSohNUJcoiptjDB43Np+IHGJtgDFXnBti8SSR54Gk1yAAVrXg
         S5MNypfET8gFky3uMnMwrl1YIqdgS+wjbfKqoXzYkN21o8ls1OXty1zCI6cgdPFhteNB
         8PAzO6lS4tIuz5iJSSbCzO+oDaSm9srubL++L/Tw9hibNUCGadqQOiskfbYKamLkp1lw
         PI2gSaIWSh5t7TWfPtp088Mao9nBhMZwfwvS0hAQuLL6X/ULX2j02cj0X8JbBNbwZACE
         NRLlGZfG1HMKeAlNyBSLppSPtcX0JrfzcBROMMRKY5DnQ6cjTOX7sYnnmlz3nAXYf9Qr
         I+TA==
X-Gm-Message-State: ACgBeo30CX9CkOAYpccRoLP018MiGclLApJY+zQKyP0fYau+XC0dfG1Q
	UNnv3G7u9cmVXOig3fPYO9g=
X-Google-Smtp-Source: AA6agR57Xaz/Sv3hksaBQZHcfqE+BOwZHQhh0tXNqUeibP9IAHNiFB2O+UvExvW6jYOK4VgxY94zGQ==
X-Received: by 2002:a17:902:a5c7:b0:172:dd10:f638 with SMTP id t7-20020a170902a5c700b00172dd10f638mr1323811plq.127.1662512890636;
        Tue, 06 Sep 2022 18:08:10 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4 ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id om2-20020a17090b3a8200b001f22647cb56sm13392417pjb.27.2022.09.06.18.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 18:08:10 -0700 (PDT)
Date: Tue, 6 Sep 2022 18:08:05 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/2] ARM: dts: aspeed: elbert: Enable mac3
 controller
Message-ID: <Yxfu9bqIfGOMN0C4@taoren-fedora-PC23YAB4>
References: <20220905235634.20957-1-rentao.bupt@gmail.com>
 <20220905235634.20957-3-rentao.bupt@gmail.com>
 <YxaS2mS5vwW4HuqL@lunn.ch>
 <YxalTToannPyLQpI@taoren-fedora-PC23YAB4>
 <Yxc1N1auY5jk3yJI@lunn.ch>
 <45cdae58-632a-7cbb-c9d5-74c126ba6a3e@gmail.com>
 <YxfZOPz/iWVm0G5F@taoren-fedora-PC23YAB4>
 <YxfnkSAVq6FO0vd/@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxfnkSAVq6FO0vd/@lunn.ch>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guangbin Huang <huangguangbin2@huawei.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Hao Chen <chenhao288@hisilicon.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Liang He <windhl@126.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Wed, Sep 07, 2022 at 02:36:33AM +0200, Andrew Lunn wrote:
> > Specific to this Elbert platform, we don't have plan to configure
> > BCM53134 via OpenBMC MDIO (dts), because we expect the switch always
> > loads configurations from its EEPROM.
> 
> DSA offers more than configuration. You can also get interface
> statistics, and knowledge of if an interface is up/down. And since the
> PHY of the switch becomes normal Linux PHYs, you can do cable testing,
> if the PHY has support, etc.
> 
> Do you have spanning tree to break L2 network loops? Linux will
> provide that as well.
> 
> However, if you are happy with dumb switch, then what you posted is
> sufficient.
> 
> 	Andrew

Apprently I have very limited knowledge in DSA area, because I didn't
know these features.

I will keep the patch series as is for now, to at least enable ethernet
in Elbert OpenBMC, and will work out new patch series to add BCM53134 in
DSA later.

Thanks again for the review.


Cheers,

Tao

