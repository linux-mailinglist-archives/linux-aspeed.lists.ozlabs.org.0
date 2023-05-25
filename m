Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A489F7158E5
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 May 2023 10:41:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVm8h5qqDz3bcc
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 May 2023 18:41:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=re+Hu0Q6;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r4IBGzHn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=re+Hu0Q6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r4IBGzHn;
	dkim-atps=neutral
X-Greylist: delayed 455 seconds by postgrey-1.36 at boromir; Thu, 25 May 2023 19:42:08 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRjkm6NRFz3c9s
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 May 2023 19:42:08 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685007268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tqKiheoiS4yq5jJKO080DEclkNiRCw8ceYhBPpYSW10=;
	b=re+Hu0Q6naTRkLuq5eU7bi7VBahJ3jr8aBUqXzdjEscO6fFefxJ4TqV6CgzTNijC2fRXEj
	nu/Rl1HplALQsfWCrafjfKln2JD4fEY/y4CGiBpm+F/utJGJna0zH65rWpmFIigo1OXnQ2
	JQOwRBFtYZ/Cr/UstwBmiZI5kldN8MsDZ+z2CLqSj4/zsFpK1nFj+ND1YuHsq6f0BVYhVJ
	0n0mY+Ob923slWcssK+rAXjXd+jb9VnRVIF4La9H/mq8kfbp++g2EkNcoBOP2b3btKuEIc
	0b6z9UrYO9ES6eAX8JQytY6NFHakxcLgBMMlOVqeDuclJyZOtbsuL46JyufeoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685007268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tqKiheoiS4yq5jJKO080DEclkNiRCw8ceYhBPpYSW10=;
	b=r4IBGzHnpEiWatgryztcx7z8+JEUnFfYdoY3NU/fQz+ApYAmVt2J4BJIgkGCYHlUDFC5l5
	NYrEmYigRZtQ8iBA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH tty v1 0/8] synchronize UART_IER access against console write
Date: Thu, 25 May 2023 11:37:51 +0206
Message-Id: <20230525093159.223817-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 May 2023 18:40:56 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Al Cooper <alcooperx@gmail.com>, Douglas Anderson <dianders@chromium.org>, Jiri Slaby <jirislaby@kernel.org>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Matthew Howell <matthew.howell@sealevel.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>, Petr Mladek <pmladek@suse.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Lino Sanfilippo <l.sanfilippo@kunbus.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

In preparation for making the 8250 serial driver the first driver to
support the upcoming atomic consoles [0], its console write()
callback (serial8250_console_write) was evaluated. For this callback
of the 8250 driver there are two critical writes to the UART_IER
register: once to disable all interrupts before transmitting a line
of text, and again after transmit to re-enable the previously enabled
interrupts. These two writes are performed under a single
synchronized section protected by the port lock.

I then checked all other access to UART_IER in the 8250 driver to see
if they always occurred under the port lock. If not, it would be
possible that the console write() callback could overwrite or restore
incorrect values to UART_IER. This is illustrated in the commit
message of the first patch.

Indeed several call sites were discovered where UART_IER is accessed
without the port lock. This series adds the missing locking in order
to ensure UART_IER access is always synchronized against the console
write() callback.

For call sites where UART_IER access was already performed under the
port lock, this series adds code comments and (when appropriate)
lockdep notation to help catch any future issues that may creep in.

Note that some of the new usage of port lock is not strictly
necessary, because (for example) the console is disabled before it
is suspended. However, these are not hot paths and by taking the port
lock it simplifies the synchronization semantics for UART_IER to
allow general lockdep usage.

Also note that none of these patches have been tagged for stable. The
possible stable candidates do include Fixes tags. But since the fixes
are not based on real-world reports, it probably is not necessary to
backport them.

John Ogness

[0] https://lore.kernel.org/lkml/20230302195618.156940-1-john.ogness@linutronix.de

John Ogness (8):
  serial: 8250: lock port in startup() callbacks
  serial: core: lock port for stop_rx() in uart_suspend_port()
  serial: 8250: lock port for stop_rx() in omap8250_irq()
  serial: core: lock port for start_rx() in uart_resume_port()
  serial: 8250: lock port for rx_dma() callback
  serial: 8250: lock port for omap8250_restore_regs()
  serial: 8250: lock port for UART_IER access in omap8250_irq()
  serial: 8250: synchronize and annotate UART_IER access

 drivers/tty/serial/8250/8250.h              |  6 ++
 drivers/tty/serial/8250/8250_aspeed_vuart.c |  3 +
 drivers/tty/serial/8250/8250_bcm7271.c      |  4 ++
 drivers/tty/serial/8250/8250_exar.c         |  4 ++
 drivers/tty/serial/8250/8250_mtk.c          |  9 +++
 drivers/tty/serial/8250/8250_omap.c         | 41 +++++++++++-
 drivers/tty/serial/8250/8250_port.c         | 71 ++++++++++++++++++++-
 drivers/tty/serial/serial_core.c            | 10 ++-
 8 files changed, 141 insertions(+), 7 deletions(-)


base-commit: d5b3d02d0b107345f2a6ecb5b06f98356f5c97ab
-- 
2.30.2

