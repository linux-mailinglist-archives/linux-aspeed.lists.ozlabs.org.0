Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71A97E468
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 02:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBkvT0DM9z2yVV
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 10:51:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727052675;
	cv=none; b=alwhboPmx7VVh7cr4u1fq6A8Qw7jDh/dyWYPKxf7sFWuubIv3PX8FbXYFhUFBSEEFRHGB6MbtdzY1wmwfM63OxYiEew3QTpHbB7TyQKF95kkCSjuxINoiiqYtWOIgMyzt+/J5E2chzNv+ixbJrCO65z267TPW0ltWSsoCINKqZ90gV4sk4a5S6Nr4GXNuXbUwrwWLklNAj8TAukiDwhg1MZELyR37v8kRXe4a3ELFGJRcc2q3Zy11ODSZikby4iGTttEz2i4ffArgTFYy6GmhyIz4SJ6lDMvWM8vP8tz7CUtelYjGox7z9MIuj9DQuW1RnmISXOf73acnlfNNghyag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727052675; c=relaxed/relaxed;
	bh=yc/v7062ftDZZgYI+EVeZmB31bsnrmNYD1yD91QAJVY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FrgE+A6431ZB0qfrgjN8VNvIrESvvwJfN+yispPFssUHhsegtXkvjxr4ZKlNcIJTsI3sv0Sj0oncGnwt0IMzoaO4ILDLEykQvfRz8yu0TbRc7eO4pYOB0rZi414Lw+fGrm2Au7dFdeQlPaFBiGmDqujLN9Q9/zVwIuo7RIYUaKClNJ42WM/uLf4CSjWZYe34NTgDSedFVXOsFfRoaFBFTGqbsQI5iEjCFecu7wvVq8L/l3FkFSiZeqPESjd9/ndlUvHd1Sx2VWG6h7JRh+HhfYSfhCf59bxhiwC2H1vANJMPgAc4/RrjC2+rY4aub3NnukNCXGUD9GVQ1nkPCFoZiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HBsM2u+U; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HBsM2u+U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBkvR4jF5z2xn5
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 10:51:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727052675;
	bh=yc/v7062ftDZZgYI+EVeZmB31bsnrmNYD1yD91QAJVY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HBsM2u+Uw7VUPeOsY8HCEFbiOHmb05iqGxuVSl+G13SIsP5P87SW1mVeDpP7j0Y4c
	 A+ABf8tPnX4KC6DXe4pJ4cZMJwi55Zpi7TKHkhFJsYdYY+fy7upBawMyPSN2Em9wmp
	 KaMN0OdSB1F9l4Lfy6dYXyGcNzfx2E81pYsC9gcTMzkaM6NRPMtD1p8SlUYbmZtzg8
	 qMDqR8bg/a2Ps9+8K2CmbPGRMVvctic8iTQpkApcw+Ie7brkDE/DJ0pL/hJuIGz9aF
	 /u6Ub/HgaL6A/LIAegQ1/u/+R4v84zx1WDIAhGOLuoEtFgSagGwrIOqqJVWJscTEAl
	 1PbRkDzxAuWEg==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5FEC4640E8;
	Mon, 23 Sep 2024 08:51:14 +0800 (AWST)
Message-ID: <75b83e2585295bf0a9020133228a85059742465d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
 for TPM
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2024 10:21:13 +0930
In-Reply-To: <20240920080227.711691-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240920080227.711691-1-Delphine_CC_Chiu@wiwynn.com>
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

On Fri, 2024-09-20 at 16:02 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Enable spi-gpio setting for TPM device in yosemite4.
>=20

Thanks, I've applied this to be picked up through the BMC tree.

Andrew
