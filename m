Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D7987D10
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 04:34:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFF126Kb9z309h
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 12:34:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727404485;
	cv=none; b=gsTH8v5gAQ9eJGq1YlXubuXJ7MDYn10TG1xBEWQoAYDEvDibRuAll0c2m+CW0mFO3Xf/5Lm/amBGLlNHNhtORjv548hlhV8DnqAYvf7kEEQYnf+wUc4cXulMlTArYO6N0Nu33RaEi9BlwQjxuYncJ5W40x0ykyCli003z4aaN2e2kZWcIBIJ0D1CCPZFi+sidv0xlayQ/8+tH3NN5/wKEiZ4Sk68V3R3mbrUNCuFpuRMgyOStIELis6gMaVvrmI/qUPgOLPC4fcE8BskDywV04aqQfAN/djnd5MJnriOpQm+UiCRH4Q3sJY5ESpEhyvEwSr55LECtz8MhycQTTdkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727404485; c=relaxed/relaxed;
	bh=/Bt3CxeZRt+0nxxDBDZb8DllYxljljqK1Chhgqs4kUs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lrup33uKBTLuZVTZRilBLYOZThBHtYZfVdhpsJwHGyni1mEJ3DG2BOTIt3R7ZS7sNg72Rx6xpSuzV85/kkQ46uFt6dk8lUza6feA46XbG5wH0j53bFa7QYqsb9TAR+Sp1Kkmw3bDwByeHwT9qwEhgcYALhfFgmR7ydu6/yjiNkDRGi52IDbuYdTii0EJr1+TAPpLxLytwkpAOZGUju+LK8vhmhV4LeHJQsEkQSI66pGu7DihtOWIdUyR+1V3LhE9o65NVEMdlcZ7iu3KOhYHOsx8XJBr3zpNIsrIdf3c5JzrgmIAjdfmEShkdF5UzGssFwEbRWjpvrx7KuMmVB3o9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AeYZcT02; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AeYZcT02;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFF105Fmcz2xJ5
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 12:34:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727404482;
	bh=/Bt3CxeZRt+0nxxDBDZb8DllYxljljqK1Chhgqs4kUs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AeYZcT02ar1DLIsdGiOaELWrURhKKgrWfy9kB+ZRL1iUbmXna0k+hDdgQ9Aqobwf6
	 NUpF0eB74md7+svmKMzBiq7PvsVSxJPp5lM5hhYVPr7s3sqsP+n4BYAnEIciAuFPxe
	 eR/zf6OB9PczuHPy8JAs67lFH67u9by76AIyBmC691qmC/eytYcKb6b5vYPF4WNc7e
	 wiXXuBwMZ0/jGTt94gUc7nKaDq0xxtjsLLsP6Pe9DISmmaNFVVulRgS2uxV3Pmn5yS
	 aqHAaVgsYMg3Y9CGN6dyAys6XlA5eRZWqKgz+mqO4Rc7pZsELAGqBZDaX50lqrUeI5
	 OXirtgkUh69Mg==
Received: from [127.0.1.1] (ppp118-210-187-73.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.73])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7B7826502D;
	Fri, 27 Sep 2024 10:34:41 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
References: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: aspeed: catalina: dts update for EVT
 and DVT schematic
Message-Id: <172740448141.53211.18338631248150691317.b4-ty@codeconstruct.com.au>
Date: Fri, 27 Sep 2024 12:04:41 +0930
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
Cc: devicetree@vger.kernel.org, Potin Lai <potin.lai@quantatw.com>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 26 Sep 2024 15:10:43 +0800, Potin Lai wrote:
> Update Catalina devicetree based on EVT and DVT schematic changes.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

