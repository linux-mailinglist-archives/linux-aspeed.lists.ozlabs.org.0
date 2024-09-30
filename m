Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B459899E3
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 06:48:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH7r72lYGz2yNs
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 14:48:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727671717;
	cv=none; b=QdGMthHLr/ssm5VYgLn2RuReSE5Tmb7mXRw9CecU/z+8pvz4G2s2ASQXNcFEJ6PFYHHXNsWbT9b6e/EUrs7V4OZrzeZWfvwFRBhW8Z2HG78bjTzixFsznZjrgNaMop6mFCAvjBychGpJciB4Rw9cElX5SX4NBmly8yNU2+bm8FjZ06mkKTA0n5Zzz17d8FNCfaMIdv2kcskZSBWrIrhDac3Rqgqbg0ZxMltbjcJMK42EZVBoOnpTUMNQ2IhX++eUOweyQLm57XvkPEpcLeu/PDwclRAFG5qszUOT13VFMFDSk39pFQm4MmoFj0D7pI46SOKpHCu+pZneEPsczGrqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727671717; c=relaxed/relaxed;
	bh=1hzglF2sqA+Bf7TzXRh37r8UD0uQOdiDbSySAkxl8o0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NGfvJbBt3hasBGw/0J/6tHlKlseLuirsEkVoWUh7gAWOCZsIJHTdburKnFg01dvYl8heExhIkA2t2ZHTAjygzRXcLsn8dyjmRoIZ7H77XBUMqyT9P/tg6x1kju4y9Pdf9lTECAvWH1kGcSZp61egd7f4fsL5inPZ5koMqIwBjLrMEUoVLDAzC/N3uxlqEc+kZfiE5jnCNmsyJG+Pw3jHbybAgKbNKFIdpjXr/Z45+9su9yRqY34sKgD+LqkwrX7dosiwcLdMYuNw/FhIU/Z3+IkhcccW22xGE9FCkqAQcuGSPSohF3KQZlWh9w66MUy5eWyJQF4/s3BI/XDnXTh/rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CF7CARC8; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CF7CARC8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH7r50p1Yz2xHG
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 14:48:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727671716;
	bh=1hzglF2sqA+Bf7TzXRh37r8UD0uQOdiDbSySAkxl8o0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CF7CARC8xxgxLWEntkZJqNgC96GzIHWenfdOqy4HdExI40YCAOO+AcBKXtsCtY0sX
	 XoAcDEojl8Llca/MD9XtoQD8fKAmKg6cVwsUQZU7uk7pJEbrq+GPqB1eqJVWKAQo91
	 6XMXdcUeSUg7Lz/t1jL+N1L0ZcDfgKe/F2ja7iidiFhy1mGpbHcd16MnOhvXKYz+Le
	 C1cJLqXdlTgajJEOe72bVPoGiL9Bm1Y+J9b7gs4GXFaE6sZ6aOlvtF+Lsts53X3q8o
	 F+9jSRzU/byffMsfytWvkzovjeR+i3jhif9p7H6arNqWeaWOWKN3t7zbKdlP+mi0Vs
	 1Fo/3xBQuzifw==
Received: from [127.0.1.1] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1E7EE6511E;
	Mon, 30 Sep 2024 12:48:35 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240927085213.331127-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240927085213.331127-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: yosemite4: correct the compatible
 string of adm1272
Message-Id: <172767171502.99875.5222579659376110174.b4-ty@codeconstruct.com.au>
Date: Mon, 30 Sep 2024 14:18:35 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

On Fri, 27 Sep 2024 16:52:13 +0800, Delphine CC Chiu wrote:
> Remove the space in the compatible string of adm1272 to match the
> pattern of compatible.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

