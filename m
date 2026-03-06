Return-Path: <linux-aspeed+bounces-3614-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD92J0neqmlqXwEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3614-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 06 Mar 2026 15:01:45 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA9F2223A2
	for <lists+linux-aspeed@lfdr.de>; Fri, 06 Mar 2026 15:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS7PK6ZKvz2xqm;
	Sat, 07 Mar 2026 01:01:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772805701;
	cv=none; b=j3p4NChwFzoDltClQh4ejEWhQOS4F5iF5D1x1T3UCaEs2RC3xs8ijl8aGOJKmrVSUNk4LF4hQclZOifXN69XWpAgIMy/MEmk/X1UGlis6u2kJe6IPWWsDMkxJydxeYatCvbb1sCYjXLoqPhRzW3LnRFYMIYLxn+c1ocZrIf3FqszpkEKiLoAl/qbEIz10Yq3h7UEWjcbHCEMgQ8C3D9FvG5rfRr1a2EHOEHzJaxE3/LdMwtAI24wP4+duDRVJVrB4A1lqJigV1hlObi+TMQ+a/BgnDY9XOyd47BcBziCB/f3E6vcBIXnX2Qvs4GXRthUcyeCIW7vN0PekgQGXEc9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772805701; c=relaxed/relaxed;
	bh=MirfIR7Fld7DvyfLq9p3EnVSzA7tLEd1Eqq9yuQL0IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqgihpPJHqbDpSkzzcihfSssCnCifGUAJr27PJu+v4+eWLV6vzjTQO1W/xvZIAP8XYjvDmiKzGJHTNHobPI9KlgNOPM6nUZRfBWPwHZZzBgLQhnoB2HC5iFRB5k4Q8sLqiX+PnOddTFZbutyu7wevvTiYi0/nT3HopzNrQ6ehAz4ED58R2u4v9JE/d+BzcPJzb6bYDCYmwwNxeHI140MdunipUfMLZeqeJml7i217lQ+pAKyn4/Wx0jrP/sRRAKyFWYAyfhVqQzlvXkwKX3T82W1d9ishUP19QhLQ5P7BYzLzAlBYq2yVI/vj7SfHGQcwUgdjMEN/yWPhX2S2jpFmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=QUMireeO; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=QUMireeO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS7PG02Xzz2xYk
	for <linux-aspeed@lists.ozlabs.org>; Sat, 07 Mar 2026 01:01:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MirfIR7Fld7DvyfLq9p3EnVSzA7tLEd1Eqq9yuQL0IE=; b=QUMireeO4aEf+KSITfWawFA2LF
	tNODAY3TgouFyFnjIaz/qRnEmmVmogpGG2NJ6UqEqrsu0060jU5jWIdfnkdCdR3GSRf8aVDmY7Ysa
	G8UxqUuGORMrtXu7Om66TDY6wGkMfm89B87fMBKkiTUGEs6g0vw7DTdGj07qIPhff2eA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vyVjh-00AU97-OX; Fri, 06 Mar 2026 15:01:01 +0100
Date: Fri, 6 Mar 2026 15:01:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: [PATCH net-next v6 5/5] ARM: dts: aspeed: ast2600-evb: Configure
 RGMII delay for MAC
Message-ID: <344e1aed-f2a5-4249-90c1-2b848ee39d7c@lunn.ch>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
 <20260302-rgmii_delay_2600-v6-5-68319a4c4110@aspeedtech.com>
 <d38f54b2-4a99-4a54-8403-e4f4a9704386@lunn.ch>
 <SEYPR06MB5134AE0B0042E05E8E58A5239D7DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <70ed84fd-ac9d-4157-ad20-36deec0c5f82@lunn.ch>
 <SEYPR06MB51341775B041AF86CC8769F69D7AA@SEYPR06MB5134.apcprd06.prod.outlook.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51341775B041AF86CC8769F69D7AA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: ACA9F2223A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3614-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:jacky_chou@aspeedtech.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ratbert@faraday-tech.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:taoren@meta.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

> Could you please help confirm how we should proceed with this project?

That is up to you.

If you do lots of small patches with good comments, you probably can
do it in Linux. But you need to convince reviewers you are not
breaking backwards compatibility.

I think the bootloader change is simpler. But i've not worked on
bootloaders for a long time.

> 3. Send a patch to correct the phy-mode settings in aspeed-ast2600-evb.dts so that they 
> match the bootloader after the fix.
> 
> mac0: "rgmii-rxid" -> "rgmii-id"
> mac1: "rgmii-rxid" -> "rgmii-id"
> mac2: "rgmii" -> "rgmii-id"
> mac3: "rgmii" -> "rgmii-id"

You will do this anyway. However, just so that backwards comparability
gets tested all the time, i would suggest you only change mac0 and
mac3. Leave mac1 and mac2 with old settings, and add comments that old
values are being used for testing, and they should not be cut/paste
into new .dts files. And add a comment that mac0 and mac3 require the
new bootloader, if you decide to solve it that way.

	Andrew

