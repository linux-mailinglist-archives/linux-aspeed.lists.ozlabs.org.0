Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40177975E97
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 03:42:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X40Yf0XCZz2yR9
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 11:42:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726105347;
	cv=none; b=QJKmvgVxy5nX8OEhpNaxJ770LtDw63D0N1r46Xr7npwL5qdudmekrz8/CLYTnfTI0UlPNLGycJzxlgCPjObE65IcW+VZfMWB14RVJiAVYABOXBLsIYB359uP8EgxFcMTyfePq9g6tuwCFOav0OFmuIq+TMaB956kpb/CuoKxnkYpx6bfJ22lpfEiOeui/geebqt54mKjddo/A2ajH4zvILf18RJ26CC4cNQTLJryL4HVTRNR8o0IIiNTjc+qUo8TSNtfWXEjM3dRHWqN70PahW0KgQ8m/2LZK/eDn8Zq6eI1AfzO9WphEUi4aXEidyBl4p+O5wR2VmY/XJgKcMC0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726105347; c=relaxed/relaxed;
	bh=HXBEzjrhINnkFwKmcbEAFRdNpgF88rPAK0NhIO44r1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dlevpVIb2i3ybjB+WXJuzIo7e1Cpx+q0ukxmplE1Qa+0BWDsWLN68DDD0+YzLw686w7qWlD1CbO3Fni39AN6Ny6zLfiOkuuEGEF30a/mdPEJrULGBDdgf0QCZn8Ale6gkWkITZfwdWc0CZXRdMdHluokGqCMFwohnFYtxqfSv/c74oiLSz5PPNXyYwfTs3xnBMjv3pY97VmowYWytkvUZ6joSoECovJLBs4G/RcgjjhB8a9jMKNlosyxXBPoqVxe7UwuXBZG014MCsrBsdlk/sFqwkoIVUd6Tpa0K7k7rIbzxmJB/u0f6zVujz9KvMkQP0+07ienJVLNNJbqxj5VsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fB8KAnEF; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fB8KAnEF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X40Yb40dDz2y8n
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 11:42:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726105347;
	bh=HXBEzjrhINnkFwKmcbEAFRdNpgF88rPAK0NhIO44r1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fB8KAnEFOcjOww3sh7HWeeCgy97J7orYvAH5wbAPAhf5Uxljpx6sRM5/YwjpRhiG5
	 iPIEE9E0jLDaAX76YgEBRoZMlaM46U8Pt7oWCs3sVJh0h4T7SXR4fsr4Tkl8mqta4M
	 5iYPcVl7dqAKNhK4tyuL/TuQc/mdLNU57E08q0rQaGQd3Bm0goU5lX2ms4Ib8+R4q7
	 KJu0CK7WHmaeeRYhyufOXW1QVoEarh7mLFMz7nlHwvvrmxeQxLIpSjJFgIbaxB24zK
	 xBMSMX1RJqptRhnsntue8g9IJfgY+Uxlsx9AkHP4ubz77NmvQXH2zzhQODzh4tvdUv
	 CdOiQ1pHA/fJA==
Received: from [127.0.1.1] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4897D650D6;
	Thu, 12 Sep 2024 09:42:26 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240910084109.3585923-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910084109.3585923-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Change eeprom for
 Medusa Board
Message-Id: <172610534620.690179.300123501570049846.b4-ty@codeconstruct.com.au>
Date: Thu, 12 Sep 2024 11:12:26 +0930
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

On Tue, 10 Sep 2024 16:41:09 +0800, Delphine CC Chiu wrote:
> Change eeprom on Medusa Board to AT24C128 according to hardware change.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

[1/1] ARM: dts: aspeed: yosemite4: Change eeprom for Medusa Board
      commit: 41217159f292ae69e5ba255b260c77dc644f0bdc

--
Andrew Jeffery <andrew@codeconstruct.com.au>

