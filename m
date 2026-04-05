Return-Path: <linux-aspeed+bounces-3842-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPRqA3dJ1GkqsgcAu9opvQ
	(envelope-from <linux-aspeed+bounces-3842-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Apr 2026 02:01:59 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ECD3A859E
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Apr 2026 02:01:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fqRFT4TJhz2ygp;
	Tue, 07 Apr 2026 10:01:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775390574;
	cv=none; b=RZj/G41RXjw2g9+WHq81U0yk4/nH1MI2KldzjM8gxUKgLfaWBsIbmWooh5Ke3twFB2lcgk4SRtUDhG3tVBF25PJMa+Zvgt10FR4sjmoUnjK5RTpBNzNwGHLzHlCqHls4R6s041EAJtS6FL7AJxlyuKXsBday3UkWS/e8+ERLfLlvbPgKOu9AkEqQZZAJG/oOkrP8t1C3DTItj4F/uNdYuxX/z3ib9/0CmD1PD2eIlu+vAcx+iUrtBuTTLZhAltmg9TfbiB1cBQ+HSKMMK0OqsCw+LMRwLYk7mxzlnr0dNgp7jTiZLgtVPiUau6SJn9GZJ3AQzUzIhvU7YW5f58Cuig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775390574; c=relaxed/relaxed;
	bh=VwXIPBbp0EIzPNtpB2Kh8OUpJCymQVJw7CRWHLQnyH0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DCUlC3XlN9UQbsFvbqjZVHtuSgQNvQE30SXynPQY0ImTNraj+UUGMI+YSPOQQQTVH3WWOJFb9lDQdHUTqbZmBSiIU+CK+E2Il3lTErhig5SNmMo6Exqd6cO3kUUb4yEMMZVIjc/knHOlSmtpRI2AMbSeCY0+l2ardCiwoe1gE8/Yc/SoYu7qC0iTkvE4LLP73U+gjIaxJhI3jkldXVbnSiOlarAASlNv6z6A+pqxo0ALrwdjVD3utYE7OuevA2vBaeGsyngmnPYMJNbCGaqf2JoNsZPYA4M6fK8cX1QQJFyUC9C2fDGHdWVoF/lDkB98eTV9tCtL5cqZRRJBoHNDdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQwwCeNj; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQwwCeNj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fpWLP3T1cz2ySV;
	Sun, 05 Apr 2026 22:02:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0569436C8;
	Sun,  5 Apr 2026 12:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E64C19424;
	Sun,  5 Apr 2026 12:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775390569;
	bh=VwXIPBbp0EIzPNtpB2Kh8OUpJCymQVJw7CRWHLQnyH0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=qQwwCeNj+saJT57yAG47jboL8X78w4/j6WpBJ1RZ4sp8PWbMz7XsL9EDbWtj55Eiv
	 28aGEHxX84zqCSRKzt5WxDYhK2mKne18FSkXEYY++OZ6+IBYaBKFZkA86MS9bLh9Oc
	 BYyORiDakrz6RnLk4LVZHvUx8P1LQpa7pCp8fHnA1nA9F6ZvrAlepEALLMXhhTHNG5
	 7JaVWay0RJB3NcEhdmqtS8VF3DnUGPXm4QkCgawXIaUT/QfRxlFCiXeEIfDZt6r6xg
	 I3uj6fM0ROLbqxk5+qZJNhPISl9Q1iNQvp6vF94UFTOtVMPHy01bKsqbxAmGzThrrM
	 mtqWeRGNpMg3w==
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 14:02:33 +0200
Message-Id: <DHL7FCNQ20PA.2K03T8MNSO9TT@kernel.org>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
Cc: "Douglas Anderson" <dianders@chromium.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Saravana
 Kannan" <saravanak@kernel.org>, "Christoph Hellwig" <hch@lst.de>, "Eric
 Dumazet" <edumazet@google.com>, "Johan Hovold" <johan@kernel.org>, "Leon
 Romanovsky" <leon@kernel.org>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Alexey Kardashevskiy" <aik@ozlabs.ru>,
 "Robin Murphy" <robin.murphy@arm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <Frank.Li@kernel.org>, "Jason Gunthorpe"
 <jgg@ziepe.ca>, <alex@ghiti.fr>, <alexander.stein@ew.tq-group.com>,
 <andre.przywara@arm.com>, <andrew@codeconstruct.com.au>, <andrew@lunn.ch>,
 <andriy.shevchenko@linux.intel.com>, <aou@eecs.berkeley.edu>,
 <ardb@kernel.org>, <bhelgaas@google.com>, <brgl@kernel.org>,
 <broonie@kernel.org>, <catalin.marinas@arm.com>, <chleroy@kernel.org>,
 <davem@davemloft.net>, <david@kernel.org>, <devicetree@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <gbatra@linux.ibm.com>, <gregory.clement@bootlin.com>,
 <hkallweit1@gmail.com>, <iommu@lists.linux.dev>, <jirislaby@kernel.org>,
 <joel@jms.id.au>, <joro@8bytes.org>, <kees@kernel.org>,
 <kevin.brodsky@arm.com>, <kuba@kernel.org>, <lenb@kernel.org>,
 <lgirdwood@gmail.com>, <linux-acpi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-cxl@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-serial@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux@armlinux.org.uk>,
 <linuxppc-dev@lists.ozlabs.org>, <m.szyprowski@samsung.com>,
 <maddy@linux.ibm.com>, <mani@kernel.org>, <maz@kernel.org>,
 <miko.lenczewski@arm.com>, <mpe@ellerman.id.au>, <netdev@vger.kernel.org>,
 <npiggin@gmail.com>, <osalvador@suse.de>, <oupton@kernel.org>,
 <pabeni@redhat.com>, <palmer@dabbelt.com>, <peter.ujfalusi@gmail.com>,
 <peterz@infradead.org>, <pjw@kernel.org>, <robh@kernel.org>,
 <sebastian.hesselbarth@gmail.com>, <tglx@kernel.org>,
 <tsbogend@alpha.franken.de>, <vgupta@kernel.org>, <vkoul@kernel.org>,
 <will@kernel.org>, <willy@infradead.org>, <yangyicong@hisilicon.com>,
 <yeoreum.yun@arm.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260404000644.522677-1-dianders@chromium.org>
 <2026040539-sponge-publisher-2b42@gregkh>
In-Reply-To: <2026040539-sponge-publisher-2b42@gregkh>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DATE_IN_PAST(1.00)[35];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[chromium.org,kernel.org,rowland.harvard.edu,lst.de,google.com,intel.com,ozlabs.ru,arm.com,linux-foundation.org,ziepe.ca,ghiti.fr,ew.tq-group.com,codeconstruct.com.au,lunn.ch,linux.intel.com,eecs.berkeley.edu,davemloft.net,vger.kernel.org,lists.linux.dev,linux.ibm.com,bootlin.com,gmail.com,jms.id.au,8bytes.org,lists.infradead.org,lists.ozlabs.org,kvack.org,armlinux.org.uk,samsung.com,ellerman.id.au,suse.de,redhat.com,dabbelt.com,infradead.org,alpha.franken.de,hisilicon.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-3842-lists,linux-aspeed=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 68ECD3A859E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun Apr 5, 2026 at 7:27 AM CEST, Greg Kroah-Hartman wrote:
> Anyway, this looks great, unless there are any objections, other than
> the "needs to be undefined", which a follow-on patch can handle, I'll
> queue them up next week for 7.1-rc1.

Sounds good, for the series:

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

