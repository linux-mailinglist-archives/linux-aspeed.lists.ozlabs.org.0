Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E6F4F8CD7FF
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:01:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=AvAAI6Ka;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlXpL3M56z3w66
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 01:56:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=AvAAI6Ka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlXp54FZ6z3vZh;
	Fri, 24 May 2024 01:55:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716479721; x=1717084521; i=markus.elfring@web.de;
	bh=TIMNJk57A3yArfkP5l/Y5yU0QttkwhGd1NhmgzcFI2o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AvAAI6Ka4N7YFLX0MPVtAicws2w/QAs75oJnQdVN12zS1qZEAhhaA/nnt28hYuXk
	 a3OSzrhxae97ysBkSuvvSDDj32SC+15BjPm5790DSrMXQZU/CNhS/trt01eBTuwTW
	 IcMov35Hg5yy/8QKTGaOjx1FZxrhOjfHZwPVFx6T5gyPU2L4Q8H6Xhek54v+hSpce
	 2G67Ccf2iggw9pnyR1v8c3t1UxgL8v4a7cdO+4lvE7j7wMQG6wEFFFv6zkKnBtT73
	 tGZw46TIgpsqfLzdtyjZgEPuHhTeM7zptoHnSUME7d3PKO6aiAo1wF0pHvT+ujTJr
	 QCpK2ERoew70BcxYdg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N01ds-1sUbHz2lsM-00x3aZ; Thu, 23
 May 2024 17:55:21 +0200
Message-ID: <05b7feb3-8184-43c3-a4c8-fd30f13a5bab@web.de>
Date: Thu, 23 May 2024 17:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Conor Dooley <conor.dooley@microchip.com>
References: <20240522192524.3286237-6-eajames@linux.ibm.com>
Subject: Re: [PATCH v6 05/20] dt-bindings: fsi: Document the IBM SBEFIFO
 engine
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522192524.3286237-6-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JKuuEv/GLKvsh8G4/NwfhilnBuQyABiO/YwRlE1q/KxZRSNL2pL
 M1xrX0qbHL0raBK1u4y7Z1NnJ/n3Dtqj578oar2HYQwKTi8ydNWeVeOlIb6gtos9vg0914n
 f25Wu3KQn0DJRIJQ1YpHug4CVfLb+SbRHfIal9zgcFEh/x3b0VgGrF6+RxGXOBmVEtowFvi
 Ku0qRv6iHzmWMg/5z23wA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Th7Bo8htPYk=;SvhlPm571o5u3zKwYGIfflRrhE8
 xpsFGkgYOMd9Cyux9u2x1isOABxvKR9q38ig0PF41M6Lj8pODm/oLBX/F52hGE8ZQK0qpLTEa
 z/hGEmvaQmK0ArG5iEy+rNRUDCDnLGmFyP4uXvmLYXn7fhhgOsSCa4UTs+siVzdfmUzXRyknI
 fydS45RA+7Z7TePx3LA9m/dqERpCTrFbdwj6ato3EoYygpYYXDTunLRcPfBg3pATcWxOK8PqO
 8h3bEGmSizbwdGvF++6VAf7M/ZBJjUAon8cDO8BdF/IaLRgP6twu/uU1dfRluEY5CP1Q9/BQf
 fuG+Jvpoc92vJqD/plwFt7zdqogLLtoXXvIwvRuD3NQ4aK2rTY9SX4fFgYEgg6tTA9BQjGgO7
 vT+ckHw/GwgxpWcIomZaHw+IIsjFkdwDc6ZBq4ht/8oXLkuJT1h3u6E6+FjgE88AQeyAra9Eu
 x3l97o4jcMRxv4EcNHc61gJ/DZOFeLhy7wjKamh6eu2K6Nm8wVdYy6tV2Js9VAS0g2aYtwzXo
 2Ft9AnuYEzLVuL3OMkVOqvwmbpk5/jvhYaUaLJpIFSKwTLKlqtH8KbtlWujb0fWpLQUpP29v0
 hIMzXWnNoIzep2SGwsEahn1w//tAshGv55IIVOWozrzpwiO0aBurCqArDVPeXV+7D66x9oKky
 H7CKmB9vxWjisSHKZAhcoIrTqNcvwhB+p6Xvrd1/wx8XrkBo0835ldT5eKbqvRFgcWRqnFrvi
 zy1nGzZjBN+H/jt17PQ+asfj7gKud12T9EvZn1ccMEB44Pg8U/rfOS/V8MdEReuOMpTgf7UU5
 k1ywHlitSrGvFDh33uXRifu5Yb4IWa19Y6+S4nty3SW28=
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
Cc: Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Lakshmi Yadlapati <lakshmiy@us.ibm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> The SBEFIFO engine provides an interface to the POWER processor
> Self Boot Engine (SBE).

Under which circumstances will imperative wordings be applied for
another improved change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n94

Regards,
Markus
