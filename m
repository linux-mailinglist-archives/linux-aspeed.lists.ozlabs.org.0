Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C719F9A0628
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2024 11:55:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XT5tg5rWVz2yst
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2024 20:55:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729072522;
	cv=none; b=gwAjNnMKee6czHUq/g9yCYeQUIeihxciPXLE/ywTM1aqRrU3WF2tL/mXdpRjoIOxEh6+e8diX4xIU7kvBdTobqbQkpG8J9xqDl0sOKYFVPD5gfXWxW8+jXkoeCDWtdMj/qMf0iP7poN5EiWLN7pIBfm7TshiGQOmWq52RZqaX9N/mTVjrZKEjLUc2X1weAoNPLQ3mvsVuq7RZnym0YWEx5/JFge2OdskOJC+YURHVXOp+yK0G5Qc5PCFAMhbJVYqWjYLR3rhhhdEpjjZBJUmtgxJeZO3SbTzKlWWOjIHZlAjCXi+jxOeJwpSSiFbBkdXfrupXHq5gAONutIy1qgYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729072522; c=relaxed/relaxed;
	bh=B33N9NCktEKQzY6gUrpC2zYWEtyfJKfOrZV2IutPllQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hv9DniSK/xpKOLOooeZQa9ml5VZQ0AytWkDNQpKK2pmsVZ33TF2uTNxsZnVJjrd8ds5qna+ycMFml0bm8InCxiIWiNsPy69NxNYm/9EMT++Oh4wpRxcSJmk2OfSzV2bNlix7oyemO22gkq5PLORWdLBGL6P16+/4m0w+hLxt4HElygTeD+XmHpKi9yVxdyHmgQJNOhK5ZP8Ht6F6qJOsZSxLdBLgZu6OlxbuHa8XRLrGZ2D52rJDGXTcv3XReLzL9oIOKkeJvOteajnvIlYESLWwTLqAMR9bJ8XtYy5QCRVgxrFqeALi6ZlK/BQx1r4wzxd26TVlxrjcZGHiEnO2PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Je2FlEoG; dkim-atps=neutral; spf=pass (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Je2FlEoG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XT5tb1Nr9z2xpn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2024 20:55:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1729072459; x=1729677259; i=markus.elfring@web.de;
	bh=B33N9NCktEKQzY6gUrpC2zYWEtyfJKfOrZV2IutPllQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Je2FlEoG1wn1fI2boLzaSCHA9EUoNF+dLrvNmQVKhwvyLQaab6SDfCTOC7HeVHmh
	 nhYKmAi5n/f1lkTKGFmbMuck4ek6ag7oyTa+dgjf+Ek/v5tJM36FMXypYT8lqokBM
	 J91tjrKBcnlxetSDpRYbGDMAiD6+hOtgmGW03ADO3jbvoYeN2M5LcUf8E09Zobutg
	 jJqZtAqssIzuEvLcT06PUQZmJ+T/NazeSZIxtFovPF0m7prsfhhGWy/m/PkODpuWs
	 Ke8Zd4UuO0N7xca3w7dHvEIaLQBUk1He+8RaAhGyjz3HoJ/6BO8lX1jSJTPwk6Z/q
	 DE0enNNycmOFXgIr1w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGgNS-1tDiK90UFO-00Dmjj; Wed, 16
 Oct 2024 11:54:19 +0200
Message-ID: <42c7dfe1-451b-4f70-8358-725cf3eed549@web.de>
Date: Wed, 16 Oct 2024 11:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
To: Thomas Gleixner <tglx@linutronix.de>,
 Kevin Chen <kevin_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
 <f65dd139-1021-47d6-93a1-1477d6b4ca1d@web.de> <874j5ddow1.ffs@tglx>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <874j5ddow1.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:5PdP4OeLPruXhve1TsYeyQlvYAJ06iKJriezhlJsCtBxNnKyTNx
 tNA77FMgapaBdZdjEsYh5tNukeEBponwO2/mdM2WRXYPipqo6efWLIslsPF/dmaBgTgIIHG
 9blNFdTKuFT41sDFmnDzkCWjPZDuGGIFPMhj00W4i5aTQxEaNeisM5aBtn3C3aDSAHnMT03
 5T/ms4ppv03+sfNzkZBWA==
UI-OutboundReport: notjunk:1;M01:P0:GDpmqTIObF8=;P+X0BK25UKhmiTH5Wz/6TTqcklE
 C/eBsj8x2ZwmC5cHvXLA49jMiMcLY12hG2naqPWceqI67SY/+2ao69O+zfdvI6GyL5qdgFNKa
 LTgbjkxJ0ViOaR9AhJE3ImYx/Peh7TArul5Gwsmtziopxz/OsXTjTUgLQMUirnBJ3oC041jW9
 5cwMh2+qy/PK3AMzdWI5z9MAiGv1jywQDeoSjVO2MCqmo7mi86XIe2yPUCQ3BT5eYLTPM/Izh
 L53gJC5EG6dSRPnEuoanGBLnVPgBVEYd2Xyhi5TeUtXzW+zA6qlJwzdr2bjRheOcfpAnYBxnZ
 rmbnI3qUxbV2LK9C0iA3uqO14ASDbLnzZf184D9bSuIRysOwf5Kt8Ge+qBUtyqfB+8Uwt0/RT
 EY6AzoCI9idnxpm6tdLdWucU0vp6b5BaAtXKFH9gszMLuxa5h+9lsZbmJISl6BWhz1Pri6Nxl
 MdkBSew4sMwG8l/JB+GTlLlGYjbjCaBWwb6DxIfN/uxoGVgrm1aN3euOwZxkBh+p+AWORUOKC
 svcwtVudNFGDc7q+1qQXRhEvj/VITCbs95AeQrTjQNSGFjVGTOaH6k7717UuKb1S/SaHVknrK
 yjU4Re6IsAGhWDmBjJWXLNevczVm9dHuZgKTu24WK508oyp3uH8FbV6H5uMxzhv7+/BY36exo
 JwvR7ytBkatPki8VqYeuvnVd8v7dZ7+FKWp67ZvcWclXsJ/jO5eTIeiAkkTH188V5vfFmT0Nu
 HUIlA69XcqeZT8c0ZpIMEy2c/KV3HhH/2N8060jNdHqUJI0F2u5fJdaCYSrk8nc3Zdx82sE0M
 FANtqddy42xjvhpS1AWw92nw==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> Making a guard variant of chained_irq_enter/exit needs some thought and
> a general plan for cleaning the whole chained irq usage up. It's on the
> cleanup list already with quite some other items.

I became also curious how API usage will evolve further here.


> We are not adhoc adding a guard variant because guards are hip right now.

Application interests are growing, aren't they?


> And no this does not need a scoped variant ever.

There are subsystems which seem to prefer such a programming interface occasionally.


> guards are not the panacea for everything.
Their usage might become more popular.

Regards,
Markus
