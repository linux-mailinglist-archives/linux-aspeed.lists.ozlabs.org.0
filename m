Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9897E465
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 02:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBkj10cJcz2yTy
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 10:42:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727052131;
	cv=none; b=PWyjkTrM/7Rwwfvw3lepGGbTZFMSyjg5vXyhc4mmfsSK+s/00ugt+Ywdtqa934zAwkcYCoVzxKlmlfbkYXZmklz34uJqE8SLh+n5MuqdHLoxCe6a+jtlNUgykagCS95+sBh5eHbiCez5r9B1cap4fTzbJccm5MtSAcgS89aWy6c1a6fWPMORFQiGC820ETtBlyLoQHuKqGTqkOv6e4b4p2nfxi36Tgoy2LUTnFqCAB/gFl5RAEDMgFGpY7xs8BcnlB8aYJCO7tVXuHED3+ntN5/o0dVNSXO7BaZ6AqnyxPhwyuVQ1vORo/IbJZ7MYr2xVchzFHNhOimXOxp/sAfP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727052131; c=relaxed/relaxed;
	bh=vBTcWXfAX/Of7UXHfGEZxY/8XoDeqqNxmQWzQQsQ7uk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BrxmZ4ppOG+m+yI7lpc3aHvXBAu3s/w+ZgNaN+UN1JtvCCCf4OZc7BIzoLVVBphRGNDnNB8KVjube+HaiqgXAjb0icQqwm1m8KlMU29wcuUr0+uQoddTsR/7e4Tc/Du2PMPDRrbZhOwT4sTpLTcx0BtWaRLNIS9qoUD3Wy44OhXCFXmV3wxxSrFODfECY1DQ+iYlnpcAvn83mjBPSaZmdWWa+yRyYihD065lN+5KT0IZgxsiAFCy3o4CaNvj3Hdq8BBPZgF5XL6dfOQX7OXJ1HqfzKfnvlOCX1GtIjA7Z2an7GkwOXKSHm4PJZQA0BNLr5B9jxQfXiex4GkaBRWTKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TCpJPEX1; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TCpJPEX1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBkhz1b4gz2xgv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 10:42:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727052130;
	bh=vBTcWXfAX/Of7UXHfGEZxY/8XoDeqqNxmQWzQQsQ7uk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TCpJPEX1xFhafjbEHITGVvsxf3aoLQBHm7eczRdT5C6SflAs8JBEKr2HXyFRgF9QH
	 FL3bpkEU92HSY0/ZWhPXmPk6k1d/EKm5/EZ5i3qDs3LvIrTw8cMI1jqwRd4MuHtADS
	 3Fb3qy6DfrJva9SaxrOuPHeyXTNB3JF9jCsaYKpKkgAzFz11LF2kha621YZokyAQhP
	 u3wU27oPCb/NFLabXdxOU2e5FeykX4hszKtJ729eXJoV26li4w4MazR8Z2iwbjg9wm
	 HRBOXOH7O1Bvk81FdiCBtHaHUzezFDd8xXZNsotS6jXHupc3TdwuLzVVzfRxMuWX/5
	 ZaJSIhyuIhZdA==
Received: from [127.0.1.1] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E8820640E8;
	Mon, 23 Sep 2024 08:42:09 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240920085007.1076174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240920085007.1076174-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc
 mode on Spider Board
Message-Id: <172705212979.81175.5974392458583781139.b4-ty@codeconstruct.com.au>
Date: Mon, 23 Sep 2024 10:12:09 +0930
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

On Fri, 20 Sep 2024 16:50:07 +0800, Delphine CC Chiu wrote:
> Revise adc128d818 adc mode on Spider Board according to schematic.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

