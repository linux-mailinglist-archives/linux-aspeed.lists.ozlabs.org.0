Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A1975EE2
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 04:27:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X41Y23V0Zz2yRM
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 12:27:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726108020;
	cv=none; b=fTQxs5oQYxBpkkrCkWj8Zk9tcq4mIxf2lj5nrDo+WUKqTn8O51hD2TuSkw2QDWAb7nLW1cqjgyU68wBV5wVvN6pifLOq+bmjexmz4ynsTEDqy5JFrTUF5C909zDFrfYhxPqiRH3PfXElKcMCG/s9YbxPYIUQxnjYDGqiMQTtlfBJEXFU+9mHhHEYzsVhfVBCv75EkO1zYC7Lb936hE/5o9xUzcj+tHBOF8BYnsK/ieX5qm2DFEbhvLLxMRvJS4+8QX9YMmDvWAb0qI2dqzXrV4rUSlrNmOgYpDG0rh1cYP0BxNFjp3C93mtCR2U2L6JKzWfefxOJLHUFeeWnNVRMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726108020; c=relaxed/relaxed;
	bh=4T+rDZ0xJ2wcnLPEZ14zB7/g2o2IjvlNz0qDcwZKU/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DSzQMgUeJ9u+eRbIRZPS11V/zI1JVtKYEWPOcKqLfRmb/1GIHLO0X7AFq1U3CdgGcMhIzsyvJahp9umCLG71F+F/wUAKqBOHTI08NeDP9yRCyLC4rCK1vkKKpB+IbJ5Eh3wtfK4tW9xML00YGqPGlK1g1cXY9oj5tUceBulf02gaztYJhB5slrBx5NsetZXlWcA4hULfOr96Ae1RQL5ZOIFupjuk6Eg49blj1/7DSU+iPYrKRCoJnaKfgd+y2OLKibHUIw/ZfoBjDhdiPCseSQLqdjI3CAWkPqjyJtEBwrkBYf0nMtdKid9SP3t0kxuSO6f9SoPQHhjlQ+M2DyBsog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=M0lMF+m5; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=M0lMF+m5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X41Y02Vvcz2xmh
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 12:27:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726108019;
	bh=4T+rDZ0xJ2wcnLPEZ14zB7/g2o2IjvlNz0qDcwZKU/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=M0lMF+m5rm6jq08qEg42+8u0hQV2kXypF2aBpBQs6gO8f1qcAEKHWuwD6zUseVOah
	 oE6YLdG/BwvAQu3nuBIPjNhsvSzHxgMiYtiuI9c8iGjlQVwoaDfddfClpj3JEJi4bG
	 LrxU6d3FLkP7ppDGdf8BNZbvnLf7oVX0ICXDVaBs0qE7LEeE7fHpUBTOFdZ8EKNurC
	 e0FB8+H4ZKWBRUl8E9dUFHiTVwjB+a08QpZoCnSDSaimkOf4dlEpP7Fm0jzOLEXCXs
	 xyZM6OPdFVagMaLEfgD720gpdosvfbg8RlUdPGx6QgoXN4DUE8w7uQtFziFaXPuHU/
	 S4eV5aabqvBAw==
Received: from [127.0.1.1] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F1A34650D6;
	Thu, 12 Sep 2024 10:26:58 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240910022236.1564291-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910022236.1564291-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Enable adc15
Message-Id: <172610801889.712033.6359452612409373701.b4-ty@codeconstruct.com.au>
Date: Thu, 12 Sep 2024 11:56:58 +0930
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

On Tue, 10 Sep 2024 10:22:36 +0800, Delphine CC Chiu wrote:
> Enable Yosemite4 adc15 config for monitoring P3V_BAT_SCALED.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

[1/1] ARM: dts: aspeed: yosemite4: Enable adc15
      commit: e3b9afda18a6dc7975197a061c698142deeccc1b

--
Andrew Jeffery <andrew@codeconstruct.com.au>

