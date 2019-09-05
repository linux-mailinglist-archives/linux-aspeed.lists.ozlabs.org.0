Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AFFA97EA
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 03:17:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P2pl5JcWzDqS4
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 11:17:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P2pc03VDzDqwh;
 Thu,  5 Sep 2019 11:16:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="qC2qRvus"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46P2pY6XTQz9sDQ;
 Thu,  5 Sep 2019 11:16:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1567646214; bh=DXTgeOmuXfwC3EBG65Q5ZHiFQDzDfXWxRmKBq/pmZFk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=qC2qRvusbp/QzUYOBZK6uvQS5bQ+Yezq5IzrzrI3ECpwTaKzq9PTmLN1Q2toaVMRW
 TMn9lDis35Ahhp3GhjNKnOYxEcqX6YcCW+RbJo84luYza10JUUI8FGqgCvNjE3BLXb
 0+hRHNj4m4209Vxbrd6aQGqRhY/1ktTW0c7RbfEI6L9XnpqyGNs1qgbq6QIYsu2IqL
 yco5aBeY6/F1tUaxZrpLNW+dYPybeJbp6pyrBCmmKMRhR1YFG7Wvw6kHKqg2SHBrjv
 20Ko6ZLtKP0ctQCbIA8nv6nPVRIeIxMuiLq6Zhk0h9Go7u3qilgHeywJpsPq7m0m7g
 DMXivjoWUqrog==
Message-ID: <f1d2757119807a48833eba193cd9b443dde0ccba.camel@ozlabs.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: serial: 8250: Add documentation for
 espi-enabled.
From: Jeremy Kerr <jk@ozlabs.org>
To: Andrew Jeffery <andrew@aj.id.au>, Oskar Senft <osk@google.com>, Joel
 Stanley <joel@jms.id.au>
Date: Thu, 05 Sep 2019 09:16:53 +0800
In-Reply-To: <b4670171-e161-4d7a-91dc-a1e5a95f7dbc@www.fastmail.com>
References: <20190731013404.243755-1-osk@google.com>
 <20190731013404.243755-2-osk@google.com>
 <b4670171-e161-4d7a-91dc-a1e5a95f7dbc@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Oskar,

> Given it's ASPEED-specific I expect you should use a vendor prefix for the
> property, e.g. aspeed,espi-enabled.
> 
> However, as I understand it you want to determine what polarity the SIRQ
> should be regardless of which of eSPI or LPC are enabled, so I don't think
> the property name should be an explicit statement about eSPI. Maybe
> "aspeed,sirq-polarity-sense"?

Yep, +1 on Andrew's comments here. This property isn't an indication on
whether espi is enabled, but a method to detect it.

Cheers,


Jeremy

