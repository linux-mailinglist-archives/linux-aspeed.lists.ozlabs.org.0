Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3EA975EC7
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 04:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X41BQ25cXz2yS0
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 12:10:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726107051;
	cv=none; b=IhCZFG1gcKZreRXyl5C/40pEZCX3ecWdyGm4+TKQ6Dsj/ENfOLqoyUsBE5qtzC+J3f1RlyN02ghXhospjHrcF4p03DfjqAWsNNsG4URHK+Z11cWYKKitW2/3nH5/Sog9KJsWekjSL7zpqTItZMxXYtf6PQO+Vu/z8TbVLp9Z+/zTgOtTjPQG/lGj3Wiu9kvmtp9PMiqGM5nPLYZS6gyfNNoXuzYXh8yME4ea6pxOjFawTJuLzoLmBCZcN+miqmbLlVbFA+t/oXK4p8lR0Qe+hK11szUZ6t6eVa2Pu+yCJVQpLimBtHk1qDpgx9ls8tCtqKNxU3zClNV7fTSnSHu4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726107051; c=relaxed/relaxed;
	bh=2LaLyx7zyb56bK2TU4DCBHWv1c41cNWe6RFydXIXBPY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g626oI23CT5b/cQFJFGrpgx6OSqzapAVeIw76Dglbj8cB+hpDqv11HjWrTxp0gPz9zOM1y9WVGc+sTRt6biKWfQ8vpIZ4U9NPtoO+PxxYkgUyqDhASFnWzh0bow/vg90YX6/86VfVpiaDE7yp6S5gbaID7h7Qf4/4N0Rer3TZtwElQEPhQ0LF3M4U48j4ItDihFKXEyFioQKOG65lsxnYK1trcCUb52SZSmM4VrXGEb9VZXUbgyabHEUXrp67FaWGxHAoTNJsR2KEYdIwxHpnd7ekONQz2vjJNfJsZneXRv7JQY7s9h9r3CCbDQ9PDx95r44S+ukgUrc2SInqud5JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hBZ3oH02; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hBZ3oH02;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X41BM4hDLz2xk7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 12:10:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726107051;
	bh=2LaLyx7zyb56bK2TU4DCBHWv1c41cNWe6RFydXIXBPY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hBZ3oH029X4Lqtkmx7x+tv3L/RMwd4BCdPUAVpWUMdI+CnTu8he+qdmUiuB3X+//0
	 oUJdl0FY2R3P4Lp2+Jwqcdu7t2e1JldZDcJ9S6tD6hFfQneRnBEAxUCBRtaWCpNCsX
	 OxY2paMacjRtlPSiS5VNwujyMAnfz7mvU4GDDvE1oUIRfda7pgQo2ChJu2qjyl6hTa
	 ntbKkfHjXXQmhR8sk7Sd7jJZLaym0Vh2TU9kcOHxdVd8+m6wJ0rGwLEgJLujLxhe6J
	 QNuD69keeMJ4qmoybbIQjJrGVVuuASubL7l3PNclpMAuBdqRAXAmkVnU2X6+3Zi6g+
	 fRlc1WEr0GeYw==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7A63E650D6;
	Thu, 12 Sep 2024 10:10:49 +0800 (AWST)
Message-ID: <ccef1d90b9a7eb343e99afa2c6cd6ea7407b0541.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] ARM: dts: aspeed: yosemite4: Add gpio pca9506
 for CPLD IOE
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 12 Sep 2024 11:40:48 +0930
In-Reply-To: <20240910054751.2943217-3-Delphine_CC_Chiu@wiwynn.com>
References: <20240910054751.2943217-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240910054751.2943217-3-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-09-10 at 13:47 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> We use CPLD to emulate gpio pca9506 I/O expander on each server
> boards.
> Therefore, add pca9506 to probe driver for the CPLD I/O expander.

I think it might be best if you add your own compatible to the list in
the gpio-pca95xx binding just in case there are some behavioural quirks
of your CPLD implementation? Not sure if this should be
"facebook,pca9506" or "wywinn,pca9506", but assuming facebook, from
there you can specify

    compatible =3D "facebook,pca9506", "nxp,pca9506";

This allows you to add the quirks to the driver as required in the
future through the more-specific compatible.

Andrew
