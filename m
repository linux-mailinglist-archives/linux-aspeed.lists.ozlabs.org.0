Return-Path: <linux-aspeed+bounces-150-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569BE9D3300
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Nov 2024 05:54:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtTYC21Kcz2xvh;
	Wed, 20 Nov 2024 15:54:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732078463;
	cv=none; b=AF14leqgykzHZqfiNYFl7cHzQymAxYizzULGT34ADQq4jWNpzgwzQMl4EWMuBlXAdPG5RpVHuNJRqvXtbyF+bsViPrV9FGOt1XurNXbBhx05UHu56i22gB8B5dWuj3hKXQanNftW1/spdxigAuVnpfRnbAsFtLfvCs57d6EGJq4+1Mwx08c8SPWwnirgbtcGNkEs/93UaD9f7So71xxOA/3Az7PnpITkqLji7vX9pJgGW9UXmrMsO6sB5SwXmsP8q9pTZ+OdBJbib6Q9sdnIt2/Jida9SNVzSyDP2m+tPJOQnhD6Yf5kNl1ZjMVLCn3WZWjwvvoUEBa4Rm5YTccLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732078463; c=relaxed/relaxed;
	bh=m0rejVzUQ8KWXV5movCkOFjMtx+/Mx0idUJFVHrt9mc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=msSSMQpK9K10X4Ci5vCrqsuytK9QstdAOow8Tj+YUp+CiHmrNN3Wt8+mu6tAm1yAZbaka0dAJA8Lryoka1m+kJj6FDtoDThS/jbPwXNcXqSLc9huWsPBqtfJPs2qbiZYqPLv8Ku/S6h5PyXVaoR21zh/WTePBzV8rMJ269t7R8nB3v8ulUNQw3QavhaYSobVCXqMtX8FrLQrwYa2vO9U0nHSiykZla5ZKj6xOESMCLkpb82VS27/jDkNDPo5opsjIHDNnZZU4URH9nQ4meVUyKOVVhXSQ/3/cAecsNo1g+IWOFbNZE7RfORODOvmnZByiO0loI6V/QN6Ui4NlwaRfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NvXLS/23; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NvXLS/23;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtTYB3fhrz2xr4
	for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Nov 2024 15:54:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1732078461;
	bh=m0rejVzUQ8KWXV5movCkOFjMtx+/Mx0idUJFVHrt9mc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NvXLS/23phZOX0oazXs4Xv1vRCgMfkzmxFiB2ptYRe7mgYNjLB+TA0uCUFMX3lLt0
	 OdWVhkBFqcddqEvt0LlVxkQKBwKzKGDLyAGbg1UAww346BcgXd7qG/6KHHdeO4ybza
	 Zj3pDAQiZ9KF3qsFAFEp46bpmY2+rQIq7Jvk5SihOKZEEDcnz4ebdfw0jHkb+a44ON
	 cMjJ7xFGrTa1NblXj0zmPI/zgfoLxjKj+axuEaCzOGUIXeiIKimOLX0kL8+a/oLxXi
	 jPXESR1UDnEITr7oNggg5/MSGOLEk3fiXM8s2krf4/Cn5H5Q8AK5sKcQ6b2mJuW+mY
	 CKvW8eYkKhmsw==
Received: from [192.168.68.112] (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9637766403;
	Wed, 20 Nov 2024 12:54:19 +0800 (AWST)
Message-ID: <1bc83ee73545f9aab6e0a931cda8f5ffe41cb445.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Chin-Ting Kuo
	 <chin-ting_kuo@aspeedtech.com>, Patrick Williams <patrick@stwcx.xyz>, 
	"wim@linux-watchdog.org"
	 <wim@linux-watchdog.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
 <linux-watchdog@vger.kernel.org>, "Peter.Yin@quantatw.com"
 <Peter.Yin@quantatw.com>, "Patrick_NC_Lin@wiwynn.com"
 <Patrick_NC_Lin@wiwynn.com>, "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
  "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, BMC-SW
 <BMC-SW@aspeedtech.com>,  "chnguyen@amperecomputing.com"
 <chnguyen@amperecomputing.com>
Date: Wed, 20 Nov 2024 15:24:18 +1030
In-Reply-To: <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
	 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
	 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
	 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
	 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
	 <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
	 <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 2024-11-18 at 17:27 -0800, Guenter Roeck wrote:
> So, again, what exactly would userspace do with the information that
> this
> was a watchdog triggered warm reboot ? Why would it need that
> information ?

I'll defer to the others on To/Cc to answer that.

My only position is I don't think changing behaviour of existing
drivers to exploit WDIOF_EXTERN1 as a graceful-reboot indicator is a
good idea either. Obviously I don't have much skin in the game with
watchdog maintenance, so my thoughts shouldn't have much influence
beyond the Aspeed-specifics, but I just didn't want to see some fun new
confusion or incompatibility arise as a result.

Andrew

