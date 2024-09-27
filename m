Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 655B7987DE7
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 07:40:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFK6p3Jm9z30Tp
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 15:40:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727415596;
	cv=none; b=IqM8dvYDAQ9UmHZVUUJBQSeDCOCda4vaWP70EQvfQZIsKScxKiU3tnK+A6zr571WuVTejogi2pvNeUnGW0bcGDK85x36Yt175MLJRoQItdBlgkGMClPEGj/AQBw8AkCMDzt5hTt0LMRHs7t0AsgP82RXvRrU6GfjkfRZ7Wl26sOm0Sc6oY7ZFfjeoyJ1Be747OFImSf6q1cX5mK+qjfhHl8VtH3uC6sSgdcpwraSngR0hy/ShRvHFEwRXgRuCupo8GDCfHQ4Ow9Q116fp/2juRef4DaUxFHz9nQZvJW8lN4Haxr4AJj4QvGx37MBdiGc2Cvyn80u8Om+StvO8gixAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727415596; c=relaxed/relaxed;
	bh=m5OUpOetzsXoAqOByKCFgjROaGZzuqPSQlQ6mVDbpaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qiuk6OOdFYLP+7KyNj3vO5+BpGE9DAfillQmM9kPl5ka3Zfu2XvcNVseI5zKT7uskP2ZYuugcMOh7FYzGNynMHEbn08Unufi7Z0TRr9NpMZoBDvWy9qe4wrFjc5WSFGSj8FyeADfZYT2nWiwAacIZXILhZaIk+iZwhtCXoaNWHwJFWappQYfnezXv79zgbDEa0rP59XdqHnbBiJD53iNN7fdCTk1m2Xnw1a6GA3jSNI5FBF45hzb4u40KLD6nCLMY1QaIz6Bdxg1robTEuIL6tcIhEV7KJijs+RuDDMaZveayEFCovI5k0JrgpD1pHBH/qgTNOnvjrTrpT21ujQJlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GH08yYRf; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GH08yYRf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFK6h6gVjz307C
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 15:39:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727415595;
	bh=m5OUpOetzsXoAqOByKCFgjROaGZzuqPSQlQ6mVDbpaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GH08yYRfIQqnc5tujy9F27me68bYTRmq2TOWuRaRmtfIhMUFZvgxGrgEekI7VjM90
	 SttVZaQqaInQ3IO2f37UvZw1C2OIwBqzclSurwhJDExm41AK6AXwN4xxrD7NJ8SRan
	 TH8KF6pJ3RZiPbAMlfn1BEWtndS4F5y/+vVFsge2ROcxRZh/7KLopgJU+aSq6Zzi3d
	 dXpdrqqeErxQAwXwuNIIVmHXpL9KmEZGqmQOx6ZOL0vYCeyScBfhKU1DlmX5RYSHT6
	 nCod4poQorxkFpfGNVXRMTFtxq5LuckHlCMauB3TA+DU70TFBOH6LPoyRhVFmH3gm6
	 kpp6Wl92cUvpA==
Received: from [127.0.1.1] (ppp118-210-187-73.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.73])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8B84265013;
	Fri, 27 Sep 2024 13:39:52 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240926033534.4174707-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240926033534.4174707-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Add i2c-mux for
 Management Board
Message-Id: <172741559101.63677.6738786477314974380.b4-ty@codeconstruct.com.au>
Date: Fri, 27 Sep 2024 15:09:51 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Thu, 26 Sep 2024 11:35:33 +0800, Delphine CC Chiu wrote:
> Add I2C mux for Management Board to separate the I2C bus 35 for
> updating CPLD firmware and I2C bus 34 for the other devices.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

