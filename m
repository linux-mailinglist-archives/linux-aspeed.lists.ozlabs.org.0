Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BA98CA6C
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 03:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJGwP29k6z2yPq
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 11:11:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727831474;
	cv=none; b=XYpb599mEOtDv5l3r51E2ugptEBiN/mPrLN25K9BfCiZHvKUHNuOdKX0cOXpb7OQ74OcLO8dD0rGXjmEgjIxxEy56cwuM2O06bUpQb9rHEPgjFhdrKonk1CZbWW5h4/Io0I5PWvBJlc5uzBO643blIPqUFwXptw1Ivn8VT/+nF7CenKbpu0ycpokN9M8fPFc7xRqI4HhsKKqBCW9mIep6/VnUUDvdaftjtn7fC3kbN/211X6opEhY7XW5oAAZuqZsAJmSNuoNNhuX31N+AhUktOtP9utD4ojDIbHNk52hR0nYZnz8K2XjykmuloIO5KRySWnVmwINAlhL0icq3rBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727831474; c=relaxed/relaxed;
	bh=R7ianpyjVN3B1nD5oOZXXzjVfCLquaxvQ92VdRcmNZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WRYwHYgSX+Gww2yUKAa+rwweRqivFEGhOQ6DbbGyMqXINSdIiCIpwELEzggdKblJykBOg9ZhFmOrlxAD98Kp4yhtpo6FYa+j1l3uXnsmgDX8jqlCpE7sPASaWyviJ090WXQL5nsPHX1nIfE1minGrUMAi6G596Gj3oj3ZUqYbJbqfDOnn1SkgXQU8c9Q8Zka6uf2xBfq+CIsl7/5KMake4GGG9hMVspQGRQy79XdRMAHoT9Rg+qzlzYQ00RzoerWkGFuUZntdNsvO1kvRY5I9FPAL+p2D5A7fbTBIPLff+3pmIwRNx6ztBTkTM9XT/fo+L2OHa62N6CwN4i2qKsxtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Hw0Oovjq; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Hw0Oovjq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJGwL3Gczz2xtc
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 11:11:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727831473;
	bh=R7ianpyjVN3B1nD5oOZXXzjVfCLquaxvQ92VdRcmNZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Hw0Oovjq0FhlSpSOKhxl4cXMyqH92tBOl/m3qKdMddaW7fbXFxpcbCFss8aoVWxlE
	 S9HRupTwKJKjTtM73/QkKEfji1bD6N90DEvHz3gFVSgL8pnAvEfW/rNIYnCFs9IqGd
	 q0lZj9qrKg9w6uIB8CDZLHNPgn+tS+B5XIJh+WgpVq6M6tH5zKocn2fdVncwr/ZKr3
	 BuZVCKbPye7cU8pdcVTj/mnRIidksgcKtatbrsogkO+NRzy/DnNFCg3Qfh35vYmH31
	 1A49NhzpqXzLWMfD8jWL/bJZJx1KxxZOsUy8cS2WmLXsVWk3q9n7Hui8mmBcgOb/IF
	 0Psvf49wypxiA==
Received: from [127.0.1.1] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 800C165013;
	Wed,  2 Oct 2024 09:11:11 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20241001083021.3462426-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241001083021.3462426-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Remove IO expanders on
 I2C bus 13
Message-Id: <172783147141.796785.17563061044470770294.b4-ty@codeconstruct.com.au>
Date: Wed, 02 Oct 2024 10:41:11 +0930
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

On Tue, 01 Oct 2024 16:30:21 +0800, Delphine CC Chiu wrote:
> Remove IO expanders on I2C bus 13 according to schematic change.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

